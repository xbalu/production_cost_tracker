Rails.application.routes.draw do
  root to: 'home#index', as: 'home'

  devise_for :company_owners, path: ''

  as :company_owner do
    get 'profile', to: 'devise/registrations#edit', as: 'edit_company_owner_profile'
    patch 'profile', to: 'devise/registrations#update', as: 'company_owner_profile'
  end

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

  resources :application_users, except: [:show]
end
