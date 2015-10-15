# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Skill < ActiveRecord::Base
  validates :name, presence: true, uniqueness: :true

  has_many :vacancy_skills
  has_many :vacancies, through: :vacancy_skills

  has_many :applicant_skills
  has_many :applicants, through: :applicant_skills
end
