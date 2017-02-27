require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { create(:user) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(3) }
  it { is_expected.to allow_value("user@blocipedia.com").for(:email) }
  it { is_expected.to validate_presence_of(:password) }

  describe "attributes" do
    it "should have email attribute" do
      expect(user).to have_attributes(email: user.email)
    end

    it "responds to role" do
      expect(user).to respond_to(:role)
    end

    it "responds to admin?" do
      expect(user).to respond_to(:admin?)
    end

    it "responds to standard?" do
      expect(user).to respond_to(:standard?)
    end

    it "responds to premium?" do
      expect(user).to respond_to(:premium?)
    end

    it "does not respond to fake role" do
      expect(user.role).not_to respond_to(:administrator)
    end

    it "sets the default role to standard" do
      expect(user.role).to eq("standard")
    end
  end
end
