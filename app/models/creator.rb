class Creator < ActiveRecord::Base
  has_many :categories
  has_many :users, through: :categories
  has_many :videos
  has_many :tweets

  def add_videos
    vimeo_access_token = ENV["VIMEO_ACCESS_TOKEN"]
    videos = HTTParty.get("https://api.vimeo.com/#{self.uri}/videos",
      headers: {"Authorization" => "bearer #{vimeo_access_token}", 'Accept' => 'application/json' }, format: :json).parsed_response
    if videos.length > 0
      videos.each do |video_json|
        vid = Video.new(video_json)
        vid.user_id = self.id
        vid.save
      end
    end
  end

  def add_tweets
    
  end

end
