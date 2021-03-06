Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?

  provider :twitter, ENV["TWITTER_CLIENT_ID"], ENV["TWITTER_CLIENT_SECRET"], scope: "user:email"

  provider :vimeo, ENV["VIMEO_CLIENT_ID"], ENV["VIMEO_CLIENT_SECRET"]

end
