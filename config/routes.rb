# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'users/profile', as: 'user_root'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items do
    get :upvote, on: :member
    get :expensive, on: :collection
  end
end
