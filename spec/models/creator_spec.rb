require 'rails_helper'

RSpec.describe Creator, type: :model do

  let (:creator1) {FactoryGirl.create(:creator)}
  let (:user1) { FactoryGirl.create(:user)}

  let(:log_in) {
  current_user = create :user
  session[:user_id] = current_user.id
  session[:access_token] = "1234454433"
  }

  describe 'add videos' do
    context "it create videos" do
      it "has a data" do
        log_in
      end
        VCR.use_cassette 'get_videos' do

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
  end

  describe "add_videos"  do

  end
  describe "add_tweets" do

  end
end
