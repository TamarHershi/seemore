require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #create" do
    context "logs in with Twitter" do
      context "it is successful" do
        before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]}
        it "redirects to root path" do
          get :create, provider: :twitter
          expect(subject).to redirect_to root_path
        end
        
        it "creates a user" do

        end
      end

      context "it fails" do

      end
    end


  end
end
