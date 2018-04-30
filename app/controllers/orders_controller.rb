class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update, :destroy]

  def index
    @filter = OrdersFilter.new(permitted_orders_filter_params)
    @orders = @filter.filter
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(permitted_order_params)

    if @order.save
      redirect_to orders_path, notice: t('.flash.success')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(permitted_order_params)
      redirect_to orders_path, notice: t('.flash.success')
    else
      render :edit
    end
  end

  def destroy
    @order.destroy!

    redirect_to orders_path, notice: t('.flash.success')
  end

  private

  def set_order
    @order = Order.find_by(default_find_by_params)
  end

  def permitted_orders_filter_params
    company_owner_scope permitted_filter_params(:orders_filter, :key, :description)
  end

  def permitted_order_params
    company_owner_scope params.require(:order).permit(:key, :description, :amount)
  end
end