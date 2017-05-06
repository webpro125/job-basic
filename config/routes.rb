Rails.application.routes.draw do
  devise_for :users, path: '/', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'registration'
  }, controllers: { registrations: 'users/registrations', sessions: 'users/sessions', passwords: 'users/passwords' }

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
