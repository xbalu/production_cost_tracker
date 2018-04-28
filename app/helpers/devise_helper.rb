module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    resource.errors.full_messages.join('<br />').html_safe
  end
end
