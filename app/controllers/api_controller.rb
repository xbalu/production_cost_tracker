class ApiController < ActionController::Base
  around_action :render_json_response

  private

  def render_json_response
    render json: action_call_result
  end

  def action_call_result
    action_handler_const.new(action_attributes).call
  end

  def action_attributes
    send("#{action}_attributes").to_h.symbolize_keys
  end

  def action_handler_const
    Module.const_get(action_handler_name)
  end

  def action_handler_name
    [module_name, '::', action.classify, 'Handler'].join
  end

  def module_name
    controller_name.classify.pluralize
  end

  def action
    params[:action]
  end
end
