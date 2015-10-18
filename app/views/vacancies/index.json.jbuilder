json.array!(@vacancies.active) do |vacancy|
  json.extract! vacancy, :id, :name, :created_date, :validity, :salary, :contact
  json.skills vacancy.skills do |skill|
    json.extract! skill, :id, :name
  end
  json.url vacancy_url(vacancy, format: :json)
end
