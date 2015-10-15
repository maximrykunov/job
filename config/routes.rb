Rails.application.routes.draw do
  resources :skills

  root to: 'visitors#index'
end
