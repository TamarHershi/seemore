class Creator < ActiveRecord::Base
  has_many :categories
  has_many :users, through: :categories
  has_many :videos
  has_many :tweets

  def add_videos
    vimeo_access_token = ENV["VIMEO_ACCESS_TOKEN"]
    videos = HTTParty.get("https://api.vimeo.com/#{self.uri}/videos",
      headers: {"Authorization" => "bearer #{vimeo_access_token}", 'Accept' => 'application/json' }, format: :json).parsed_response
    if videos["data"].length > 0
      videos["data"].each do |video_json|
        vid = Video.new ({
        uri: "#{video_json["uri"]}",
        name: "#{video_json["name"]}",
        description: "#{video_json["description"]}",
        embed: "#{video_json["embed"]["html"]}",
        posted_at: "#{video_json["created_time"]}"
      })
        vid.creator_id = self.id
        vid.save
      end
    end
  end

  def add_tweets
    
  end

end
