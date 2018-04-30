class CompaniesController < ApplicationController
  def search
    autocomplete_response Company.where("name ILIKE ?", "%#{params[:query]}%").order(:name)
  end
end
