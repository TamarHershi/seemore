class CreatorsController < ApplicationController

  def index
    if !@current_user.creators.nil?
      @creators = @current_user.creators
    else
      flash.now[:notice] = "Try following some people first!"
    end
  end

  def create
    @creator = Creator.new(
    name: params["name"],
    provider: params["provider"],
    profile_pic: params["profile_pic"],
    description: params["bio"],
    )
    @creator.save
    @creator.users << @current_user
    redirect_to creators_path
  end

end
