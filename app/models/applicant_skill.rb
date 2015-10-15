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

class ApplicantSkill < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :skill
end
