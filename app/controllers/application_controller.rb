class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_controller

  before_action :authenticate_company_owner!

  private

  def layout_by_controller
    devise_controller? ? 'login' : 'application'
  end

  def after_sign_out_path_for(*)
    new_company_owner_session_path
  end

  def company_owner
    current_company_owner
  end

  def permitted_filter_params(key, *args)
    params.fetch(key, {}).permit(*args).merge(params.permit(:page, :per_page, :sort, :order))
  end
end
