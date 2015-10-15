Rails.application.routes.draw do
  resources :vacancies

  resources :skills

  root to: 'visitors#index'
end
