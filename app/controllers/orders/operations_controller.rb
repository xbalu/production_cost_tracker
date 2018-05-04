module Orders
  class OperationsController < ApplicationController
    before_action :set_order, only: [:search]

    def search
      autocomplete_response @order.operations
                                  .where("key ILIKE :query OR description ILIKE :query", query: "%#{params[:query]}%")
                                  .order(:created_at), text_attributes: [:key, :description]
    end

    private

    def set_order
      @order = Order.find_by(company: company_owner.company, id: params[:order_id])
    end
  end
end
