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
      expect(Creator.new(name: creator1.name, uid: "gooola")).to_not be_valid
      expect(Creator.new(name: "zoxksmwbdjcusadk23053fd")).to be_valid
    end
  end

  describe '.find or create' do
  end


  describe 'get videos info' do
  end


  describe 'create videos' do
    before(:each) do
      VCR.use_cassette 'get_videos' do

    end


end
