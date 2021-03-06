require 'resque/server'

# Helper constant for resources that
# will only require RESTful routes
RESTFUL = [:index, :show, :create, :update, :destroy]

# Build application's routes
Rails.application.routes.draw do

  # Includes RailsAdmin interface
  # Development-only
  if Rails.env.development?
    scope '/admin' do
      mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin' # RailsAdmin mount
      mount Resque::Server.new, :at => '/resque'                  # Resque Server mount
    end
  end

  # API Routes
  resources :contact_methods, only: RESTFUL
  resources :share_profiles, only: RESTFUL
  resources :update_dispatches, only: [:index, :destroy]
  post 'share', to: 'share_profiles#share'

  # Routes for User model & authentication
  devise_for :users
  post 'auth_user', to: 'authentication#authenticate_user'
  post 'auth/register', to: 'authentication#register'

end
