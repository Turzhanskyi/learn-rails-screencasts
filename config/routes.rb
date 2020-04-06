# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items do
    get :upvote, on: :member
    get :expensive, on: :collection
  end

  get 'admin/users_count' => 'admin#users_count'
end
