module WorkOnOperations
  class StartHandler < WorkOnOperations::BaseHandler
    private

    def handler_call_result
      response(response_params)
    end

    def response_params
      if operation.present?
        if any_ongoing_operation_present?
          { success: false, message: 'Can not have more than 1 active operation at once' }
        else
          { success: true, data: { id: work_on_operation.id } }
        end
      else
        { success: false, message: 'Operation not found' }
      end
    end

    def any_ongoing_operation_present?
      application_user.work_on_operations.active.any?
    end

    def work_on_operation
      @work_on_operation ||= WorkOnOperation.create!(operation: operation, application_user: application_user)
    end
  end
end
