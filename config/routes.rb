require 'resque/server'

RESTFUL = [:index, :show, :create, :update, :destroy]

Rails.application.routes.draw do

  # TODO - Admin Only, test
  scope '/admin' do
    mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin' # RailsAdmin mount
    mount Resque::Server.new, :at => '/resque'                  # Resque Server mount
  end

  # Contact Methods
  resources :contact_methods, only: RESTFUL
  resources :share_profiles, only: RESTFUL
  # resources :update_dispatches, only: [:index]

  # # # # #

  # TODO - revise this to handle JSON routes for Registration, Password Reset, etc.
  devise_for :users
  get 'users',      to: 'users#index'
  get 'users/:id',  to: 'users#show'
  post 'auth_user', to: 'authentication#authenticate_user'

  # # # # #

  root to: "home#index"

end
