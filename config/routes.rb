Rails.application.routes.draw do

  devise_for :users, path: '/user', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'registration'
  }, controllers: { registrations: 'users/registrations', sessions: 'users/sessions', passwords: 'users/passwords' }

  devise_for :admins, path: '/admin', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'registration'
  }, controllers: { registrations: 'admins/registrations', sessions: 'admins/sessions', passwords: 'admins/passwords' }

  authenticated :admin do
    root 'projects#index'
  end

  authenticated :user do
    root 'projects#search'
  end

  root 'home#index'

  resources :projects, path: '/job' do
    get :search, on: :collection
    resources :project_applies, path: 'apply', only:[:new, :create]
  end

  resources :project_applies, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
