# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "foods#index"
  resources :foods
end
