class ApplicationUsersActivitiesController < ApplicationController
  def index
    @filter = ApplicationUsersActivitiesFilter.new(permitted_application_users_activities_filter_params)
    @activities = @filter.filter
  end

  def permitted_application_users_activities_filter_params
    company_owner_scope permitted_filter_params(:application_users_activities_filter,
                                                :application_user_id, :order_id, :operation_id, :date_from, :date_to)
  end
end
