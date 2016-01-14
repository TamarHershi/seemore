class UsersController < ApplicationController
# get all tweets from User
# save them to db
  def show
    @videos = @current_user.videos.to_ary.sort_by{|video| video.posted_at}[0..24]
    @tweets = @current_user.tweets.to_ary.sort_by{|tweet| tweet.posted_at}[0..24]
    @media = [@videos, @tweets].flatten.sort_by{|media| media.posted_at}
  end

end
