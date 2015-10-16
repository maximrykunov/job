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

class Vacancy < ActiveRecord::Base
  validates_presence_of :name, :created_date, :validity, :salary, :contact

  has_many :vacancy_skills, dependent: :destroy
  has_many :skills, through: :vacancy_skills

  scope :active, -> { where("created_date <= now() and (created_date + validity) >= now()") }

  # accepts_nested_attributes_for :vacancy_skills, :reject_if => lambda { |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :skills, :reject_if => lambda { |a| a[:name].blank? }, allow_destroy: true

  # def skill_name
  #  skill.try(:name)
  # end

  # def skill_name=(name)
  #  self.skill = Skill.find_or_create_by_name(name) if name.present?
  # end

  def active?
    created_date <= Date.today && (created_date + validity) >= Date.today
  end
end
