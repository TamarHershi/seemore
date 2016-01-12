require 'rails_helper'
require 'spec_helper'
require 'pry'

RSpec.describe CreatorsController, type: :controller do

context "when logged in with twitter" do

  let(:category) { create(:category) }
  let(:user) { category.user }
  let(:creator) { category.creator }

  before :each do
    session[:user_id] = user.id
  end

  describe "GET #index" do
      context "is successful" do
        it "redirects to creator index page" do
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
    end

    describe "GET #create" do
      context " " do
          it "assigns the @current_user var" do
            get :create, provider: :twitter
            expect(assigns(:current_user)).to be_an_instance_of Creator
          end
  end



        #
        # it "assigns the session[:user_id]" do
        #   get :create, provider: :github
        #   expect(session[:user_id]).to eq assigns(:user).id
  #   end
  # end


  describe "add_videos"  do

  end

  describe "add_tweets" do

  end

end
