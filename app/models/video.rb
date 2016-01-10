class Video < ActiveRecord::Base

  def initialize(video_json)
    uri = video_json["uri"]
    description = video_json["description"]
    player_url = "https://player.vimeo.com/#{self.uri}"
  end

end
