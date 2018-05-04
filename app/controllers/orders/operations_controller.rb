module Orders
  class OperationsController < ApplicationController
    before_action :set_order, only: [:search]

    def search
      autocomplete_response @order.operations
        .where("operations.key ILIKE :query OR operations.description ILIKE :query", query: "%#{params[:query]}%")
        .order('operations.created_at'), text_attributes: [:key, :description]
    end

    private

    def set_order
      @order = begin
        base = Order.where(company: company_owner.company)
        order_id = params[:order_id]

        if order_id == '{value}'
          OpenStruct.new(operations: base.joins(:operations).select(select_attributes.join(', ')))
        else
          base.find(order_id)
        end
      end
    end

    def select_attributes
      [
        'operations.id',
        'operations.key AS key',
        'operations.description AS description'
      ]
    end
  end
end
