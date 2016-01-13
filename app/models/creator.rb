class Creator < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :uid, uniqueness: true
  has_many :categories
  has_many :users, through: :categories
  has_many :videos
  has_many :tweets

  def self.find_or_create(params)
    creator = self.find_by(uid: params["uid"], provider: params["provider"])
    if !creator.nil?
      return creator
    else
      creator = Creator.new(
          name: params["name"],
          provider: params["provider"],
          uid: params["uid"]
            )
        if creator.provider == "vimeo"
          if !params["profile_pic"].nil?
            creator.profile_pic = params["profile_pic"]["sizes"][2]["link"]
          else
            creator.profile_pic = "vimeo_default_image.png"
          end
          creator.create_videos
        elsif creator.provider == "twitter"
          if !params["profile_pic"].nil?
            creator.profile_pic = params["profile_pic"]
          else
            creator.profile_pic = "twitter_default_image.png"
          end
        end
        if creator.save
          return creator
        else
          return nil
        end
    end
  end

  def get_videos_info
    vimeo_access_token = ENV["VIMEO_ACCESS_TOKEN"]
    videos = HTTParty.get("https://api.vimeo.com/users/#{self.uid}/videos",
      headers: {"Authorization" => "bearer #{vimeo_access_token}", 'Accept' => 'application/json' }, format: :json).parsed_response
      return videos
  end

  def videos?(videos)
    !videos["data"].nil?
  end

  def create_videos
    videos = get_videos_info
    if videos?(videos)
      videos["data"].each do |video_json|
        video_id = video_json["uri"].gsub(/[^0-9]/, "")
        vid = Video.new ({
        uri: "#{video_json["uri"]}",
        name: "#{video_json["name"]}",
        description: "#{video_json["description"]}",
        embed: "https:\/\/player.vimeo.com\/video\/#{video_id}",
        posted_at: "#{video_json["created_time"]}",
        vimeo_id: "#{video_id}"
      })
        vid.creator_id = self.id
        vid.save
      end
    end
  end

  def add_tweets

  end

end
