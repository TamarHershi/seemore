require 'rails_helper'

RSpec.describe Creator, type: :model do
<<<<<<< HEAD

  let (:creator1) {FactoryGirl.create(:creator)}
  let (:user1) { FactoryGirl.create(:user)}

  let(:log_in) {
  current_user = create :user
  session[:user_id] = current_user.id
  }






  describe 'create videos' do
    before(:each) do
      VCR.use_cassette 'get_videos' do

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

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:uid) }
    it "must have a unique uid" do
      expect(Creator.new(name: creator1.name, uid: "gooola")).to_not be_valid
      expect(Creator.new(name: "zoxksmwbdjcusadk23053fd")).to be_valid
    end
=======
  describe "validations" do

>>>>>>> 1bcd911ecef8a4d7be8d68db591a1a00521e2cec
  end

  describe "add_videos"  do

  end
  describe "add_tweets" do

  end
end
