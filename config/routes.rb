Rails.application.routes.draw do
  root to: 'home#index', as: 'home'

  devise_for :company_owners, path: '', controllers: { invitations: 'company_owners/invitations' }

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

  resources :companies, only: [] do
    get :search, on: :collection
  end

  resources :application_users, except: [:show] do
    get :search, on: :collection
    get :activities, on: :collection, to: 'application_users_activities#index'
  end

  resources :orders, except: [:show] do
    get :search, on: :collection
    get :performance_chart, on: :collection, to: 'orders/performance_chart#index'

    resources :operations, only: [] do
      get :search, on: :collection, to: 'orders/operations#search'
    end
  end
end
