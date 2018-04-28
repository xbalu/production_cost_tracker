Rails.application.routes.draw do
  root to: 'home#index', as: 'home'

  devise_for :company_owners, path: ''

  namespace 'api' do
    namespace 'application_users' do
      post 'sign_in'
      post 'sign_out'
    end

    namespace 'work_on_operations' do
      get 'active'
      post 'identify'
      post 'start'
      patch 'finish'
    end
  end
end
