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
    @creator = Creator.find_by(name: params["name"])
    if !@creator.nil?
      if !@current_user.creators.include?(@creator)
        @creator.users << @current_user
        flash[:notice] = "You're now following #{@creator.name}."
      elsif @current_user.creators.include(@creator)
        flash[:notice] = "You're already following #{@creator.name}"
      end
    else
      @creator = Creator.new(
        uri: params["uri"],
        name: params["name"],
        provider: params["provider"],
        profile_pic: params["profile_pic"]["sizes"][2]["link"],
        description: params["bio"],
      )
      @creator.save
      @creator.users << @current_user
      @creator.add_videos
      flash[:notice] = "You're now following #{@creator.name}."
    end
    redirect_to :back
  end

end
