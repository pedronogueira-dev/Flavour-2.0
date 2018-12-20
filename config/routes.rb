Rails.application.routes.draw do
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  get 'contacts/index'
  get 'meals/upcoming_meals', to: 'meals#upcoming_meals', as: 'upcoming_meals'
  get 'meals/past_meals', to: 'meals#past_meals', as: 'past_meals'
  get 'meals/:id', to: 'meals#show', as: 'meal'
  get 'availabilities', to: 'availabilities#index', as: 'availabilities'
  post 'availabilities', to: 'availabilities#create'
  delete 'availability', to: 'availabilities#destroy', as: 'availability_delete'
  get 'interests/index', to: 'user_interests#index', as: 'interests'
  get 'interests/edit', to: 'user_interests#edit', as: 'interests_edit'
  get 'dashboard', to: 'users#dashboard', as: 'dashboard'

  get 'edit_profile', to: 'users#edit_profile', as: 'edit_profile'
  patch 'dashboard', to: 'users#update', as: :update_profile
  # patch 'interests/edit', to: 'user_interests#update'
  #patch 'meals/:id/confirm', to: 'user'

  patch 'meals/:id/confirm', to: 'meals#confirm', as: 'confirm'
  patch 'meals/:id/reject', to: 'meals#reject', as: 'reject'

  get 'meals/:id/attendees', to: 'meals#attendee_list', as: 'attendee_list'

  # routes for contacts

  get 'contacts/index', to: 'contacts#index', as: 'contacts'
  post 'contacts/index', to: 'contacts#create'
  delete 'contacts/index', to: 'contacts#destroy'
  resources :contacts, only: [:update]

  # route for mailer
  get 'meals/:meal_id/attendees/:id/send', to: 'meals#contact_attendees', as: 'share_contact'

  devise_for :users
  root to: 'pages#home'

  resources :user_interests, only: [:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
