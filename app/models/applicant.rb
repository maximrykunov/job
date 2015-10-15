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

class Applicant < ActiveRecord::Base
  extend Enumerize

  enumerize :status,  in: { inactive: 0, active: 1}, scope: true

  validates_presence_of :name, :contact, :status, :salary
  validates :name, format: { with: /\A[А-Я]{1}[а-я]* [А-Я]{1}[а-я]* [А-Я]{1}[а-я]*\z/, message: 'формат: Петров Иван Николаевич'}
  validate :contact_value
  validates :contact, uniqueness: true

  private

  def contact_value
    return unless contact
    unless contact.match(/\A[^@]+@[^@]+\z/) || contact.match(/\A((8|\+7)-?)?\(?\d{3}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}\z/)
      errors.add(:contact, "формат: телефон или email")
    end
  end

end
