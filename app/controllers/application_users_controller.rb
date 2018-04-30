class ApplicationUsersController < ApplicationController
  before_action :set_application_user, only: [:edit, :update, :destroy]

  def index
    @filter = ApplicationUsersFilter.new(permitted_application_users_filter_params)
    @application_users = @filter.filter
  end

  def new
    @application_user = ApplicationUser.new
  end

  def create
    @application_user = ApplicationUser.new(permitted_application_user_params)

    if @application_user.save
      redirect_to application_users_path, notice: t('.flash.success')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @application_user.update(permitted_application_user_params)
      redirect_to application_users_path, notice: t('.flash.success')
    else
      render :edit
    end
  end

  def destroy
    @application_user.destroy!

    redirect_to application_users_path, notice: t('.flash.success')
  end

  private

  def set_application_user
    @application_user = ApplicationUser.find_by(default_find_by_params).tap do |application_user|
      application_user.send(:decode_password)
    end
  end

  def permitted_application_users_filter_params
    company_owner_scope permitted_filter_params(:application_users_filter, :name)
  end

  def permitted_application_user_params
    company_owner_scope params.require(:application_user).permit(:name, :login, :password)
  end
end
