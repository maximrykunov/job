Rails.application.routes.draw do
  resources :applicants

  get "skills/autocomplete_skill_name"
  resources :vacancies

  resources :skills

  root to: 'visitors#index'
end
