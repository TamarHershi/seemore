class UsersController < ApplicationController

  def show
    @videos = @current_user.embed_videos
  end

end
