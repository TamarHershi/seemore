Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITTER_CLIENT_ID, TWITTER_CLIENT_SECRET


  #provider :vimeo
end
