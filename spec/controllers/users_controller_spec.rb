require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET show" do
    let (:media_user) do
      user = build(:twitter_user)
      vimeo_creator = build(:vimeo_creator)
      twitter_creator = build(:twitter_creator)
      video = build(:video)
      tweet = build(:tweet)
      user.creators << vimeo_creator
      user.creators << twitter_creator
      return user
    end
    let (:no_media_user) do
      user = build(:vimeo_user)
    end

    it "is successful" do
      # get: :show
      # expect 
    end
    it "sets @media" do
      get :show, id: media_user.id
      expect(assigns(:media).class).to be_a(Array)
    end
  end

end
