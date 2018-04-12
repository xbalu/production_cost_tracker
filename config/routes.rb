Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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
