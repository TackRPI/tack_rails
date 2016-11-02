require 'resque/server'

RESTFUL = [:index, :show, :create, :update, :destroy]

Rails.application.routes.draw do

  # TODO - Admin Only, test
  scope '/admin' do
    mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin' # RailsAdmin mount
    mount Resque::Server.new, :at => '/resque'                  # Resque Server mount
  end

  # API
  resources :contact_methods, only: RESTFUL
  resources :share_profiles, only: RESTFUL
  resources :contacts, only: [:index]

  # # # # #

  # TODO - revise this to handle JSON routes for Registration, Password Reset, etc.
  # TODO - clean this up
  devise_for :users
  get 'users',      to: 'users#index'
  get 'users/:id',  to: 'users#show'
  post 'auth_user', to: 'authentication#authenticate_user'

  # # # # #

  root to: "home#index"

end
