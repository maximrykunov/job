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
  it { is_expected.to belong_to :vacancy }
  it { is_expected.to belong_to :skill }
end
