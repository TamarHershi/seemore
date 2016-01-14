require 'rails_helper'
require 'json'
require "pry"

RSpec.describe Creator, type: :model do

  let!(:creator1) {FactoryGirl.create(:twitter_creator)}
  let!(:user1) { FactoryGirl.create(:twitter_user)}

  let(:log_in) {
  current_user = create :user
  session[:user_id] = current_user.id
  }

  describe ".validations" do
    # it { is_expected.to validate_presence_of(:name) }
    # it { is_expected.to validate_presence_of(:uid) }
    it "must have a unique name and uid" do
      expect(Creator.new(name: creator1.name, uid: "gooola")).to_not be_valid
      expect(Creator.new(name: "zoxksmwbdjcusadk23053fd")).to be_valid
    end
  end

  describe '.find or create' do

    context 'creator exists' do
      let(:params) do {
                      "name" => "Edward",
                      "description" => "HELLO!",
                      "profile_pic" => "www.profilepic.com",
                      "provider" => "twitter",
                      "uri" => "/user/edward",
                      "uid" => "fdsfdsfs"
                    }
                  end
      it 'returns that creator' do
        expect(Creator.find_or_create(params)).to eq(creator1)
      end
    end

    context 'need to create a new Creator', :vcr do
      let(:create_params_vimeo) do
        vimeo_access_token = ENV["VIMEO_ACCESS_TOKEN"]
        all_results = HTTParty.get("https://api.vimeo.com/users?page=1&per_page=25&query=purple&fields=uri,name,pictures",
         headers: {"Authorization" => "bearer #{vimeo_access_token}", 'Accept' => 'application/json' }, format: :json).parsed_response
        result = all_results["data"][0]
        params = {
          "name" => result["name"],
          "profile_pic" => result["pictures"],
          "provider" => "vimeo",
          "uid" => result["uri"].gsub(/[^0-9]/, "")
        }
        return params
      end

      it 'creates new Creator' do
        expect{ Creator.find_or_create(create_params_vimeo) }.to change(Creator, :count).by(1)
        expect(Creator.find_or_create(create_params_vimeo).name.downcase).to include("purple")
      end

      context 'the provider is Vimeo' do
        before :each do
          @vimeo_creator = Creator.find_or_create(create_params_vimeo)
        end

        it 'saves some videos associated with that creator' do
          expect(@vimeo_creator.videos.nil?).to be_falsey
        end

        it 'if the videos are not populated correctly Creator is not saved ' do
          vimeo_creator = FactoryGirl.build(:vimeo_user)
          expect{ Creator.find_or_create(vimeo_creator) }.to raise_error(ArgumentError)
          expect{ Creator.find_or_create(vimeo_creator) }.to change(Creator, :count).by(0)
        end

        it 'save the Creator if there are no videos' do
        end

        it 'has a profile picture' do
        end

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
