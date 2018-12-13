Rails.application.routes.draw do
  get 'meals/upcoming_meals', to: 'meals#upcoming_meals', as: 'upcoming_meals'
  get 'meals/past_meals', to: 'meals#past_meals', as: 'past_meals'
  get 'meals/show', to: 'meals#show', as: 'meal'

  get 'availabilities', to: 'availabilities#index', as: 'availabilities'
  post 'availabilities', to: 'availabilities#create'
  delete 'availability/:id', to: 'availabilities#destroy', as: 'availability_delete'
  get 'interests/index', to: 'interests#index', as: 'interests'
  get 'interests/edit', to: 'interests#edit', as: 'interests_edit'
  get 'users/dashboard', to: 'users#dashboard', as: 'dashboard'
  get 'users/edit_profile', to: 'users#edit_profile', as: 'edit_profile'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
