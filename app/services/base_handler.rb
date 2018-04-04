class BaseHandler < ActiveType::Object
  attribute :authentication_mode, :symbol, default: :token
  attribute :login, :string, default: ''
  attribute :password, :string, default: ''
  attribute :token, :string, default: ''

  def call
    return authentication_result unless authentication_result == :success

    handler_call_result.to_json
  end

  private

  def handler_call_result
    raise NotImplementedError, 'method handler_call_result is not defined'
  end

  def authentication_result
    @authentication_result ||= send("#{authentication_mode}_authentication_result") || :success
  end

  def credentials_authentication_result
    return response(message: 'Missing credentials') if login.blank? || password.blank?
    return response(message: 'Invalid credentials') if application_user.nil?
  end

  def token_authentication_result
    return response(message: 'Missing token') if token.blank?
    return response(message: 'Invalid token') if application_user.nil?
  end

  def application_user
    @application_user ||= ApplicationUser.find_by(application_user_attributes.fetch(authentication_mode))
  end

  def application_user_attributes
    {
      credentials: { login: login, password: Base64.encode64(password) },
      token: { token: token }
    }
  end

  def response(attributes)
    ResponseBuilder.new(attributes).build
  end
end
