module ApplicationUsers
  class SignInHandler < BaseHandler
    private

    def handler_call_result
      update_application_user_last_sign_in_at_value
      response(success: true, data: { token: application_user.token })
    end

    def update_application_user_last_sign_in_at_value
      application_user.update(last_sign_in_at: Time.zone.now)
    end
  end
end
