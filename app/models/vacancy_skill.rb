# == Schema Information
#
# Table name: vacancy_skills
#
#  id         :integer          not null, primary key
#  vacancy_id :integer
#  skill_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VacancySkill < ActiveRecord::Base
  belongs_to :vacancy
  belongs_to :skill

  validates_presence_of :vacancy, :skill
  validates_uniqueness_of :skill_id, scope: :vacancy_id
end
