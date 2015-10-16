# == Schema Information
#
# Table name: vacancies
#
#  id           :integer          not null, primary key
#  name         :string
#  created_date :date
#  validity     :integer
#  salary       :integer
#  contact      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :vacancy do
    sequence(:name) {|n| "Vacancy ##{n}" }
    created_date Date.today
    validity 5
    salary 1
    contact "MyString"
  end

end
