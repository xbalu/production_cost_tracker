module ApplicationUsers
  class SignOutHandler < BaseHandler
    private

    def handler_call_result
      update_application_user_last_sign_out_at_value
      response(success: true)
    end

    def update_application_user_last_sign_out_at_value
      application_user.update(last_sign_out_at: Time.zone.now)
    end
  end
end
