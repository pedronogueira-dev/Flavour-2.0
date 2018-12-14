Rails.application.routes.draw do
  get 'meals/upcoming_meals', to: 'meals#upcoming_meals', as: 'upcoming_meals'
  get 'meals/past_meals', to: 'meals#past_meals', as: 'past_meals'
  get 'meals/:id', to: 'meals#show', as: 'meal'
  get 'availabilities/index', to: 'availabilities#index', as: 'availabilities'
  get 'user_interests/index', to: 'user_interests#index', as: 'interests'
  get 'user_interests/edit', to: 'user_interests#edit', as: 'interests_edit'
  get 'users/dashboard', as: 'dashboard'
  get 'users/edit_profile', to: 'users#edit_profile', as: 'edit_profile'
  patch 'interests/edit', to: 'interests#update'


  devise_for :users
  root to: 'pages#home'

  resources :user_interests, only: [:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
