json.array!(@vacancies) do |vacancy|
  json.extract! vacancy, :id, :name, :created_date, :validity, :salary, :contact
  json.url vacancy_url(vacancy, format: :json)
end
