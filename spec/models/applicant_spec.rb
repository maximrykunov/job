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

require 'rails_helper'

RSpec.describe Applicant, type: :model do
  subject { build :applicant }
  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:contact) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:salary) }

  it { should_not allow_value("b)lah").for(:name) }
  it { should allow_value("Свиридов Олег Петрович").for(:name) }

  it { should_not allow_value("0000").for(:contact) }
  it { should allow_value("+74950010001").for(:contact) }
  it { should allow_value("test@example.com").for(:contact) }

  it { is_expected.to have_many :applicant_skills }
  it { is_expected.to have_many(:skills).through(:applicant_skills) }

end
