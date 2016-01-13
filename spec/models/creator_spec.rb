require 'rails_helper'

RSpec.describe Creator, type: :model do

  let (:creator1) {FactoryGirl.create(:creator)}
  let (:user1) { FactoryGirl.create(:user)}

  let(:log_in) {
  current_user = create :user
  session[:user_id] = current_user.id
  }


  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:uid) }

    it "must have a unique uid" do
      expect(:creator_1).to be_valid
      expect(:creator_1).to_not be_valid
    end
  end

  describe 'create_videos' do
    before(:each) do
      VCR.use_cassette 'create_videos' do
        
      end
    end

    context "it gets videos data that isn't nil" do
      it "creates new Video instances for each video associated with a creator" do
        
      end
      it "returns nil if creator has no media" do
        
      end

      # { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:developer] }

        # log_in
    end
  end

  describe "add_tweets" do

  end

end
