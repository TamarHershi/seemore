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
      expect(:creator_1,name: nil).to_not be_valid
      expect(:creator_1).to be_valid
    end

  describe 'add_videos' do
    before(:each) do
      VCR.use_cassette 'get_videos' do
        
      end
    end

    context "it gets videos data" do


      # { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:developer] }

        log_in
      end


        end
    end


       end
     end
  end

  describe "add_tweets" do

  end
end
