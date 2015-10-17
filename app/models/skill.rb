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

  has_many :vacancy_skills, dependent: :destroy
  has_many :vacancies, through: :vacancy_skills

  has_many :applicant_skills, dependent: :destroy
  has_many :applicants, through: :applicant_skills

  scope :ordered, -> { order(:name) }
  scope :intersect, -> (applicant_id, vacancy_id) do
    where("id IN (select skill_id from applicant_skills where applicant_id = ?
                  intersect
                  select skill_id from vacancy_skills where vacancy_id = ?)", applicant_id, vacancy_id)
  end

end
