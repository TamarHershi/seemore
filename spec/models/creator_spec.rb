require 'rails_helper'

RSpec.describe Creator, type: :model do

  let!(:creator1) {FactoryGirl.create(:creator)}
  let!(:user1) { FactoryGirl.create(:twitter_user)}

  let(:log_in) {
  current_user = create :user
  session[:user_id] = current_user.id
  }

  describe "validations" do
    # it { is_expected.to validate_presence_of(:name) }
    # it { is_expected.to validate_presence_of(:uid) }
    it "must have a unique name and uid" do
      expect(Creator.new(name: creator1.name, uid: "gooola")).to_not be_valid
      expect(Creator.new(name: "zoxksmwbdjcusadk23053fd")).to be_valid
    end
  end

  describe '.find or create' do

    context 'creator exists' do
      it 'returns that creator' do

      end
    end

    context 'need to create new Creator' do
      it 'creates new Creator' do
      end

      context 'the provider is Twitter' do

        it 'saves the tweets that associated with that creator' do
        end

        it 'if the tweets are not populated correctly Creator is not saved ' do
        end

        it 'save the Creator if there are no tweets' do
        end

        it 'has a profile picture' do
        end

      end

      context 'the provider is Vimeo' do

        it 'saves the videos associated with that creator' do
        end

        it 'if the videos are not populated correctly Creator is not saved ' do
        end

        it 'save the Creator if there are no videos' do
        end

        it 'has a profile picture' do
        end
      end


      end
    end
  end


  describe 'get videos info' do
  end


  describe 'create videos' do
    before(:each) do
      VCR.use_cassette 'get_videos' do

    end
  end


end
