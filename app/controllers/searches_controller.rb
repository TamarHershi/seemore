require 'json'
class SearchesController < ApplicationController


  def search
    if params[:provider].nil?
      flash.now[:notice] = "Please select whether you want to search Twitter or Vimeo."
      render :search
    else
      search_term = params[:search]
      @provider = params[:provider]
      if @provider == "vimeo"
        results = search_api_call(search_term)
         if results["total"] == 0
           flash.now[:error] = "No results matched your search."
         else
           @results = results["data"]
         end
      elsif @provider == "twitter"
        if @results.length == 0
          flash.now[:error] = "No results matched your search."
        else
          @results = $twitter.user_search("#{search_term}").take(25)
        end
      end
    end
  end

  private

  def search_api_call(search_term)
    vimeo_access_token = ENV["VIMEO_ACCESS_TOKEN"]
    results = HTTParty.get("https://api.vimeo.com/users?page=1&per_page=25&query=#{search_term}&fields=uri,name,pictures",
     headers: {"Authorization" => "bearer #{vimeo_access_token}", 'Accept' => 'application/json' }, format: :json).parsed_response
    return results
  end

end
