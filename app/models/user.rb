require 'pry'
class User < ActiveRecord::Base
  has_many :categories
  has_many :creators, through: :categories
  has_many :tweets, through: :creators
  has_many :videos, through: :creators
  validates_presence_of :name, :uid, :provider
  validates_uniqueness_of :uid

 def self.find_or_create_from_omniauth(auth_hash)
   user = self.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])
   if !user.nil?
     # User found continue on with your life
     return user
   else
     # Create a new user
     user = User.new
     user.uid        = auth_hash["uid"]
     user.provider   = auth_hash["provider"]
     user.name   = auth_hash["info"]["name"]
     user.email      = auth_hash["info"]["email"]
     if user.provider == "twitter"
       user.avatar_url = auth_hash["info"]["image"]
     elsif user.provider == "vimeo"
       user.avatar_url = auth_hash["info"]["pictures"][2]["link"] if auth_hash["info"]["pictures"]
     end
     if user.save
       return user
     else
       return nil
     end
   end
 end


  def twitter_follow?(result)
    self.creators.each do |creator|
      if result.name == creator[:name]
        # binding.pry
        return true
      end
    end
  end

 # def self.creator?(result)
 #   creator = @current_user.find_by(uid: params["#{result.id}"], provider: params["twitter"])
 #   return true if !creator.nil?
 # end

 # def videos
 #  videos = []
 #   self.creators.each do |creator|
 #    if creator.provider == "vimeo"
 #      creator.videos.each do |video|
 #        videos << video
 #      end
 #    end
 #   end
 #   return videos
 # end

end
