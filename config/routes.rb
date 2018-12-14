Rails.application.routes.draw do
  get 'meals/upcoming_meals', to: 'meals#upcoming_meals', as: 'upcoming_meals'
  get 'meals/past_meals', to: 'meals#past_meals', as: 'past_meals'
  get 'meals/show', to: 'meals#show', as: 'meal'

  get 'availabilities', to: 'availabilities#index', as: 'availabilities'
  post 'availabilities', to: 'availabilities#create'
  delete 'availability/:id', to: 'availabilities#destroy', as: 'availability_delete'
  get 'interests/index', to: 'user_interests#index', as: 'interests'
  get 'interests/edit', to: 'user_interests#edit', as: 'interests_edit'
  get 'dashboard', to: 'users#dashboard', as: 'dashboard'

  get 'edit_profile', to: 'users#edit_profile', as: 'edit_profile'
  patch 'dashboard', to: 'users#update', as: :update_profile
  patch 'interests/edit', to: 'user_interests#update'


  devise_for :users
  root to: 'pages#home'

  resources :user_interests, only: [:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
