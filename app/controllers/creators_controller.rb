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
    if @creator
      @creator.users << @current_user
    else
      @creator = Creator.new(
        name: params["name"],
        provider: params["provider"],
        profile_pic: params["profile_pic"]["sizes"][2]["link"],
        description: params["bio"],
      )
      @creator.save
      @creator.users << @current_user
    end
    redirect_to :back
  end

end
