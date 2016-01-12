require 'rails_helper'

RSpec.describe CreatorsController, type: :controller do
  describe "GET index" do
    it "displays successfullly" do
      
    end
    it "sets @creator variable to @current_user's followed creators" do
      
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
    it "sets up the Categories relationship between @current_user and @creator" do
      
    end
  end
end
