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
  subject { create :applicant_skill }
  it { is_expected.to belong_to :applicant }
  it { is_expected.to belong_to :skill }
  it { is_expected.to validate_presence_of :applicant }
  it { is_expected.to validate_presence_of :skill }
  it { is_expected.to validate_uniqueness_of(:skill_id).scoped_to(:applicant_id) }
end
