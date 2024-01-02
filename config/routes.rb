# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: "foods#index"
  resources :foods do
    resource :likes, only: [:create, :destroy]
  end
end
