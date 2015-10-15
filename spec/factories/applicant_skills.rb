# == Schema Information
#
# Table name: applicant_skills
#
#  id           :integer          not null, primary key
#  applicant_id :integer
#  skill_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :applicant_skill do
    applicant
    skill
  end

end
