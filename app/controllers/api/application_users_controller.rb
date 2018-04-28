class Api::ApplicationUsersController < Api::BaseController
  def sign_in
  end

  def sign_out
  end

  private

  def sign_in_attributes
    params.permit(:login, :password).merge(authentication_mode: :credentials)
  end

  def sign_out_attributes
    params.permit(:token)
  end
end
