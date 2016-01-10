class Video < ActiveRecord::Base

  def initialize(video_json)
    uri = video_json["uri"]
    name = video_json["name"]
    description = video_json["description"]
    embed = video_json["embed"]["html"]
    vimeo_id = video_json["video_id"]
    posted_at = video_json["created_time"]
  end

end
