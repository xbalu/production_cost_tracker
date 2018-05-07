class CompanyOwners::InvitationsController < Devise::InvitationsController
  http_basic_authenticate_with name: ENV['HTTP_ADMIN_NAME'], password: ENV['HTTP_ADMIN_PASSWORD'], only: [:new, :create]

  helper_method :create_new_company?

  private

  def invite_params
    super.merge(company_params)
  end

  def company_params
    if create_new_company?
      params.require(:company_owner).permit(company_attributes: [:name])
    else
      params.require(:company_owner).permit(:company_id)
    end
  end

  def create_new_company?
    params.dig(:company_owner, :company_attributes, :name).present?
  end
end
