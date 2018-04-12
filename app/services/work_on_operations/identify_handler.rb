module WorkOnOperations
  class IdentifyHandler < WorkOnOperations::BaseHandler
    private

    def handler_call_result
      response(response_params)
    end

    def response_params
      if operation.present?
        {
          success: true,
          data:
          {
            key: key,
            description: operation.description,
            estimated_time: operation.estimated_time
          }
        }
      else
        { success: false, message: 'Operation not found' }
      end
    end
  end
end
