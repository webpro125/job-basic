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

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
