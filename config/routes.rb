# frozen_string_literal: true

Rails.application.routes.draw do
  post 'signup', to: 'users#create'
  post '/login', to: 'authentication#authenticate'

  resources :tickets, only: %i[index create show update destroy] do
    resources :comments, only: %i[create]
  end
end
