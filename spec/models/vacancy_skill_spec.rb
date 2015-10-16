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

require 'rails_helper'

RSpec.describe VacancySkill, type: :model do
  subject { create :vacancy_skill }
  it { is_expected.to belong_to :vacancy }
  it { is_expected.to belong_to :skill }
  it { is_expected.to validate_presence_of :vacancy }
  it { is_expected.to validate_presence_of :skill }
  it { is_expected.to validate_uniqueness_of(:skill_id).scoped_to(:vacancy_id) }
end
