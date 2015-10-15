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
end
