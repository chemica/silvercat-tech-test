# frozen_string_literal: true

Rails.application.routes.draw do
  passwordless_for :users, at: '/auth', as: :auth
  resources :users, only: %i[new create]

  get 'users/profile' => 'users#show', as: :user_profile

  get 'account' => 'account#show', as: :account

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'users#show'
end
