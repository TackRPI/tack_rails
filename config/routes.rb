require 'resque/server'

RESTFUL = [:index, :show, :create, :update, :destroy]

Rails.application.routes.draw do

  # TODO - Admin Only, test
  scope '/admin' do
    mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin' # RailsAdmin mount
    mount Resque::Server.new, :at => '/resque'                  # Resque Server mount
  end

  # API Routes
  resources :contact_methods, only: RESTFUL
  resources :share_profiles, only: RESTFUL
  resources :update_dispatches, only: [:index]

  # Routes for User model & authentication
  devise_for :users
  post 'auth_user', to: 'authentication#authenticate_user'
  post 'auth/register', to: 'authentication#register'

  # # # # #

  root to: "home#index" # TODO - need root route?

end
