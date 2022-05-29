require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { should be_valid }
  it { should validate_presence_of(:email) }
  it { validate_uniqueness_of(:email) }
end
