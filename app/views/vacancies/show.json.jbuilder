json.extract! @vacancy, :id, :name, :created_date, :validity, :salary, :contact, :created_at, :updated_at
json.skills @vacancy.skills do |skill|
  json.extract! skill, :id, :name
end
if @applicants
  json.applicants @applicants do |applicant|
    json.extract! applicant, :id, :name, :contact, :salary
    json.intersect_skills applicant.intersect_count
    json.skills applicant.skills do |skill|
      json.extract! skill, :id, :name
    end
  end
end
