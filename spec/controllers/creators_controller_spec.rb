require 'rails_helper'
require 'spec_helper'

RSpec.describe CreatorsController, type: :controller do

    let(:category) { create(:category) }
    let(:user) { category.user }
    let(:creator) { category.creator }

    before :each do
      session[:user_id] = user.id
    end

    describe "GET index" do

    context "is successful" do
      it "renders creator index page" do
        get :index
        expect(response).to render_template :index
      end

      it "is successful" do
        get :index
        expect(response.status).to eq 200
      end

      it "shows creators that the user is following" do
        get :index
        expect(assigns(:creators)).not_to be_empty
        expect(assigns(:creators)[0]).to be_an_instance_of(Creator)
      end
    end

  describe "POST create" do

    it "returns an instance of Creator if one already exists for a certain provider user" do

    end
    it "creates a new instance of Creator to follow if one doesn't exist" do

    end
    it "saves all the media for a new Creator" do

    end
    it "does not create duplicate instances Creator with same proivder & uid" do

    end
    it "does not allow you to follow a Creator you're already following" do

    end
    it "does not save new instance of Creator unless media is saved as well" do

    end
    it "sets up the Categories relationship between @current_user and @creator" do

    end
  end

end
