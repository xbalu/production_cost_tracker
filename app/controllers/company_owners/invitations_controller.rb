class CompanyOwners::InvitationsController < Devise::InvitationsController
  http_basic_authenticate_with name: ENV['HTTP_ADMIN_NAME'], password: ENV['HTTP_ADMIN_PASSWORD'], only: [:new, :create]

  private

  def invite_params
    super.merge(company_params)
  end

  def company_params
    params.require(:company_owner).permit(:company_id)
  end
end
