class UsersController < ApplicationController

  def show
    video = HTTParty.get("https://vimeo.com/api/oembed.json?url=https%3A//vimeo.com/76979871")
    @feed = video["html"]
  end

end
