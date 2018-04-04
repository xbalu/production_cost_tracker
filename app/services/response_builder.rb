class ResponseBuilder
  def initialize(success: false, message: nil, data: {})
    @success = success
    @message = message
    @data = data
  end

  def build
    response = { success: success }

    response.merge!(message: message) unless message.blank?
    response.merge!(data: data) unless data.blank?

    response
  end

  private

  attr_reader :success, :message, :data
end
