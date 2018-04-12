module WorkOnOperations
  class ActiveHandler < WorkOnOperations::BaseHandler
    private

    def handler_call_result
      response(success: true, data: { work_on_operations: active_work_on_operations_attributes })
    end

    def active_work_on_operations_attributes
      active_work_on_operations.map do |work_on_operation|
        {
          'id' => work_on_operation.id,
          'created_at' => work_on_operation.created_at.utc.to_s,
          'description' => work_on_operation.description
        }
      end
    end

    def active_work_on_operations
      WorkOnOperation.select(select_query).joins(:operation)
                                          .where(application_user: application_user).active
                                          .order(created_at: :desc)
    end

    def select_query
      'work_on_operations.id, work_on_operations.created_at, operations.description'
    end
  end
end
