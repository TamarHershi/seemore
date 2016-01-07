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

end
