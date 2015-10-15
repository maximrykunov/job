Rails.application.routes.draw do
  resources :applicants

  resources :vacancies

  resources :skills

  root to: 'visitors#index'
end
