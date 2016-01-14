class UsersController < ApplicationController
# get all tweets from User
# save them to db
  def show
    @videos = @current_user.videos
    @tweets = @current_user.tweets
  end

end
