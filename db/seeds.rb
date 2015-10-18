# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

skill_array = [
  "action planning",
  "analysing & investigating",
  "commercial awareness",
  "computing skills",
  "creativity",
  "decision-making",
  "developing professionalism",
  "drive",
  "flexibility",
  "global skills",
  "independence",
  "initiative/self motivation",
  "integrity",
  "interpersonal sensitivity",
  "leadership",
  "lifelong learning",
  "negotiating & persuading",
  "numeracy",
  "personal impact/confidence",
  "planning & organising",
  "self awareness",
  "stress tolerance",
  "teamwork",
  "time management",
  "verbal communication",
  "written communication"
]
skill_array.each do |skill|
  Skill.find_or_create_by!(name: skill)
end

# Generate applicants

1.upto(50) do |i|
  sex = rand(0..1) == 0 ? :female : :male
  ap = Applicant.new(
    name: "#{FFaker::NameRU.last_name(sex)} #{FFaker::NameRU.first_name(sex)} #{FFaker::NameRU.patronymic(sex)}",
    contact: rand(0..1) == 0 ? FFaker::PhoneNumber.short_phone_number : FFaker::Internet.email,
    status: rand(1..10) < 3 ? 0 : 1,
    salary: (rand(2..5)*10+rand(3..8)*5)*1000,
    skill_ids: Skill.limit(rand(2..6)).order("random()").pluck(:id)
  )
  ap.save
end

# Generate vacancies

1.upto(50) do |i|
  sex = rand(0..1) == 0 ? :female : :male
  vac = Vacancy.new(
    name: "Вакансия ##{rand(50000).to_s.rjust(5,'0')}-#{rand(50000).to_s.rjust(5,'0')}",
    created_date: Date.today + rand(-10..8).days,
    validity: rand(15..45),
    salary: (rand(2..5)*10+rand(3..8)*5)*1000,
    contact: FFaker::NameRU.name,
    skill_ids: Skill.limit(rand(2..6)).order("random()").pluck(:id)
  )
  vac.save
end