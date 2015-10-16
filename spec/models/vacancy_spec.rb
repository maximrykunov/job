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

require 'rails_helper'

RSpec.describe Vacancy, type: :model do
  subject { build :vacancy }
  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:created_date) }
  it { is_expected.to validate_presence_of(:validity) }
  it { is_expected.to validate_presence_of(:salary) }
  it { is_expected.to validate_presence_of(:contact) }
  it { is_expected.to have_many(:vacancy_skills).dependent(:destroy) }
  it { is_expected.to have_many(:skills).through(:vacancy_skills) }

  it "returns a vacancy active status as false for future" do
    vacancy = build :vacancy, created_date: Date.today + 5.days
    expect(vacancy.active?).to eq false
  end

  it "returns a vacancy active status as false for expire" do
    vacancy = build :vacancy, created_date: Date.today - 5.days, validity: 4
    expect(vacancy.active?).to eq false
  end

  it "returns a vacancy active status as true" do
    vacancy = build :vacancy
    expect(vacancy.active?).to eq true
  end

  describe :class do
    it 'should respond to :active' do
      vacancy_1 = create :vacancy, created_date: Date.today + 5.days
      vacancy_2 = create :vacancy
      expect(Vacancy.active).to match_array([vacancy_2])
    end
  end
end
