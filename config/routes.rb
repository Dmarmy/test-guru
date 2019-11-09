# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tests, only: [:index] do
    resources :questions, shallow: true, except: [:edit, :update]
  end
end
