require 'json'
class SearchesController < ApplicationController


  def search
    search_term = params[:search]
    vimeo_access_token = ENV["VIMEO_ACCESS_TOKEN"]
    twitter_bearer_token = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      # config.access_token = ENV['TWITTER_ACCESS_TOKEN']
      # config.access_token_secret = ENV['TWITTER_ACCESS_SECRET_TOKEN']
    end
    twitter_access_token = ENV["TWITTER_ACCESS_TOKEN"]
    twitter_bearer_token = ENV["TWITTER_BEARER_TOKEN"]
    if params[:client] == "Vimeo"
      results = HTTParty.get("https://api.vimeo.com/users?page=1&per_page=25&query=#{search_term}&fields=name,bio,pictures",
      headers: {"Authorization" => "bearer #{vimeo_access_token}", 'Accept' => 'application/json' }, format: :json).parsed_response
    elsif params[:client] == "Twitter"
      # HTTParty.post("api.twitter.com")
      # headers: {"Authorization" => "Basic #{twitter_bearer_token}", "Content-Type:" => "application/x-www-form-urlencoded;charset=UTF-8""}
      @results = HTTParty.get("https://api.twitter.com/1.1/users/search.json?q=#{search_term}%20API&page=1&count=25",
      headers: {"Content-Type:" => "application/x-www-form-urlencoded;charset=UTF-8", "Authorization" => "bearer #{twitter_bearer_token}", 'Accept' => 'application/json' }, format: :json).parsed_response
    end
    #  if results["total"] == 0
    #    flash.now[:error] = "No results matched your search."
    #  else
    #    @results = results["data"]
    #  end
  end


end
