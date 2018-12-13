Rails.application.routes.draw do
  get 'meals/upcoming_meals'
  get 'meals/past_meals'
  get 'meals/show'
  get 'availabilities/index'
  get 'interests/index'
  get 'interests/edit'
  get 'users/dashboard'
  get 'users/edit_profile'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
