class Creator < ActiveRecord::Base
  has_many :categories
  has_many :users, through: :categories

  def add_videos
    videos = HTTParty.get("https://api.vimeo.com/#{self.uri}/videos")
    videos.each do |video_json|
      vid = Video.new(video_json)
      vid.user_id = self.id
      vid.save
    end
  end

  def add_tweets
    
  end

end
