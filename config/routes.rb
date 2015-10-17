Rails.application.routes.draw do

  get "skills/autocomplete_skill_name"
  resources :skills

  get "applicants/preview/:id", to: 'applicants#preview', as: 'preview_applicant'
  resources :applicants

  get "vacancies/preview/:id", to: 'vacancies#preview', as: 'preview_vacancy'
  resources :vacancies

  # get "visitors/compare(/:applicant(/:applicant_id))(/:vacancy(/:vacancy_id))"
  root to: 'visitors#index'
end
