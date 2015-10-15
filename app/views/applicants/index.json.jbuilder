json.array!(@applicants) do |applicant|
  json.extract! applicant, :id, :name, :contact, :status, :salary
  json.url applicant_url(applicant, format: :json)
end
