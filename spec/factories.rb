FactoryGirl.define do

  factory :twitter_user, class: User do
    name "George"
    uid "1ab3da5"
    provider "twitter"
    email "test@test.com"
    avatar_url "www.image.com"
  end

  factory :vimeo_user, class: User do
    name "Nancy"
    uid "1ab3da5"
    provider "vimeo"
    email "test@test.com"
    avatar_url "www.image.com"
  end

  factory :creator do
    name "Edward"
    description "HELLO!"
    profile_pic "www.profilepic.com"
    provider "vimeo"
    uri "/user/edward"
    uid "fdsfdsfs"
  end

  # session factories

  # video factories
  factory :video do
    creator_id 3
    posted_at "Monday, February 10, 2015"
    url "www.videourl.com"
    uri "/user/video"
    name "The Best Video"
    embed "www.embed.com"
    description "I am a video"
    vimeo_id "32515"
  end

  factory :tweet do
    creator_id 3
    posted_at "Monday, February 11, 2015"
    url "www.tweeturl.com"
  end

  # category factories
  factory :category do
    association :creator
    association :user, factory: :twitter_user
  end

end
