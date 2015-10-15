# == Schema Information
#
# Table name: applicants
#
#  id         :integer          not null, primary key
#  name       :string
#  contact    :string
#  status     :integer
#  salary     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :applicant do
    name "Свиридов Олег Петрович"
    contact "test@test.com"
    status 1
    salary 1
  end

end
