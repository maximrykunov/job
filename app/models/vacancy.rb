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

  has_many :vacancy_skills
  has_many :skills, through: :vacancy_skills

  scope :active, -> { where("created_date <= now() and (created_date + validity) >= now()") }

  def active?
    created_date <= Date.today && (created_date + validity) >= Date.today
  end
end
