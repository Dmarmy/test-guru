# frozen_string_literal: true

Rails.application.routes.draw do
  get 'tests/index'
  get 'tests/show'
  get 'questions/index'
  get 'questions/show'
  resources :tests do
  resources :questions, shallow: true
  end
end