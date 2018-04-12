module WorkOnOperations
  class FinishHandler < WorkOnOperations::BaseHandler
    private

    def handler_call_result
      response(response_params)
    end

    def response_params
      if work_on_operation.present?
        if work_on_operation.ended_at
          { success: false, message: 'It has been already finished' }
        else
          { success: true, data: { ended_at: ended_at.httpdate } }
        end
      else
        { success: false, message: 'Given id does not exist' }
      end
    end

    def ended_at
      work_on_operation.tap { |work_on_operation| work_on_operation.update!(ended_at: Time.zone.now) }.ended_at
    end

    def work_on_operation
      @work_on_operation ||= WorkOnOperation.find_by(id: id, application_user: application_user.id)
    end
  end
end
