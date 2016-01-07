require 'rails_helper'

RSpec.describe User, type: :model do
  let(:twitter_user) { User.new(
    email:    "a@b.com",
    username: "Ada",
    uid:      "1234",
    provider: "twitter")
  }

  describe "validations" do
    it "is valid" do
      expect(user).to be_valid
    end
  end
end
