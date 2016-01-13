class Creator < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :uid, uniqueness: true
  has_many :categories
  has_many :users, through: :categories
  has_many :videos
  has_many :tweets

  def get_videos_info
    vimeo_access_token = ENV["VIMEO_ACCESS_TOKEN"]
    videos = HTTParty.get("https://api.vimeo.com/#{self.uri}/videos",
      headers: {"Authorization" => "bearer #{vimeo_access_token}", 'Accept' => 'application/json' }, format: :json).parsed_response
    if videos["data"].nil?
      return nil
    else
      return videos["data"]
    end
  end

  def add_tweets

  end

end
