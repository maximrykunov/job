json.extract! @applicant, :id, :name, :contact, :status, :salary, :created_at, :updated_at
json.skills @applicant.skills do |skill|
  json.extract! skill, :id, :name
end
if @vacancies
  json.vacancies @vacancies do |vacancy|
    json.extract! vacancy, :id, :name, :contact, :salary
    json.intersect_skills vacancy.intersect_count
    json.skills vacancy.skills do |skill|
      json.extract! skill, :id, :name
    end
  end
end
