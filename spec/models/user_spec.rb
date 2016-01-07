require 'rails_helper'

RSpec.describe User, type: :model do

  let(:twitter_user) { User.new(
    name: "Ada",
    uid:      "1234",
    provider: "twitter")
  }

  describe "validations" do
    it "is valid" do
      expect(twitter_user).to be_valid
    end
  end

  describe ".initialize_from_omniauth" do
    let(:user) { User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:twitter]) }

    it "creates a valid user" do
      expect(user).to be_valid
    end

    context "when it's invalid" do
      it "returns nil" do
        user = User.find_or_create_from_omniauth({"uid" => "123", "info" => {}})
        expect(user).to be_nil
      end
    end
  end

end
