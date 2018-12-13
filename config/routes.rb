Rails.application.routes.draw do
  get 'users/dashboard'
  get 'users/edit_profile'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
