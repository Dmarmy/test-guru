# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tests, except: [:new, :create, :show, :edit, :update, :destroy] do
    resources :questions, shallow: true, only: [:new, :create, :index, :show, :destroy]
  end
end
