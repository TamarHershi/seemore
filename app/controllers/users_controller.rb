class UsersController < ApplicationController

  def show
    @videos = @current_user.videos
    @tweets = $twitter.user_timeline("sarahinsea").take(25)
    @tweet = $twitter.oembed('684107967449272321')
  end

end
