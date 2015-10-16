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

  validates_presence_of :applicant, :skill
  validates_uniqueness_of :skill_id, scope: :applicant_id
end
