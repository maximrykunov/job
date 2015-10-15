# == Schema Information
#
# Table name: applicant_skills
#
#  id           :integer          not null, primary key
#  applicant_id :integer
#  skill_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe ApplicantSkill, type: :model do
  it { is_expected.to belong_to :applicant }
  it { is_expected.to belong_to :skill }
end
