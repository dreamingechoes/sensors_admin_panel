Rails.application.routes.draw do
  resources :sensors
  devise_for :users, only: :session, path: 'session',
             path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users, only: [:show]

  mount SensorsAdminPanel::V1 => '/'
  mount GrapeSwaggerRails::Engine, at: "/documentation"

  root to: 'visitors#index'
end
