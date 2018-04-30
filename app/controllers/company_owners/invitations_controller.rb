class CompanyOwners::InvitationsController < Devise::InvitationsController
  http_basic_authenticate_with name: ENV['HTTP_ADMIN_NAME'], password: ENV['HTTP_ADMIN_PASSWORD'], only: [:new, :create]
end
