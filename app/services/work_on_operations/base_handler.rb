module WorkOnOperations
  class BaseHandler < ::BaseHandler
    attribute :key, :string, default: ''
    attribute :id, :integer, default: nil

    private

    def operation
      @operation ||= begin
        Operation.joins(:order).find_by('orders.company_id = :id AND operations.key = :key', id: company_id, key: key)
      end
    end

    def company_id
      application_user.company_id
    end
  end
end
