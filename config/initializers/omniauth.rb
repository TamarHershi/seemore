Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TWITTER_CLIENT_ID"], ["TWITTER_CLIENT_SECRET"], scope: "user:email"
#
#
#   #provider :vimeo
end
