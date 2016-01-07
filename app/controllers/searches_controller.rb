class SearchesController < ApplicationController

  def search
    search_term = params[:search]
    @results = HTTParty.get("https://api.vimeo.com/users?page=1&per_page=25&query=#{search_term}")
  end
  
end
