json.array!(@applicants) do |applicant|
  json.extract! applicant, :id, :name, :contact, :status, :salary
  json.skills applicant.skills do |skill|
    json.extract! skill, :id, :name
  end
  json.url applicant_url(applicant, format: :json)
end
