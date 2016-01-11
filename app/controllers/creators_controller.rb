class CreatorsController < ApplicationController

  def index
    if !@current_user.creators.nil?
      @creators = @current_user.creators
    else
      flash.now[:notice] = "Try following some people first!"
    end
  end

  def create
    # find or create a Creator
    @creator = Creator.find_by(name: params["uri"])
    if !@creator.nil?
      if !@current_user.creators.include?(@creator)
        @creator.users << @current_user
        flash[:notice] = "You're now following #{@creator.name}."
      elsif @current_user.creators.include?(@creator)
        flash[:notice] = "You're already following #{@creator.name}"
      end
    else
      if !params["profile_pic"].nil?
        pic = params["profile_pic"]["sizes"][2]["link"]
      else
        pic = "twitter_default_image.png"
      end
      Creator.transaction do
        @creator = Creator.new(
          uri: params["uri"],
          name: params["name"],
          provider: params["provider"],
          profile_pic: pic,
        )
        @creator.save
        @creator.users << @current_user
        @creator.add_videos
      end
      flash[:notice] = "You're now following #{@creator.name}."
    end
    redirect_to :back
  end

end
