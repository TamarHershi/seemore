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

  factory :twitter_creator, class: Creator do
    name "Edward"
    description "HELLO!"
    profile_pic "www.profilepic.com"
    provider "vimeo"
    uri "/user/edward"
    uid "fdsfdsfs"
  end

  factory :vimeo_creator, class: Creator do
    name "Nancy"
    description "VIMEO!!"
    profile_pic "www.profilepic.com"
    provider "vimeo"
    uri "/user/nancy"
    uid "1ab3da5"
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
    # association w/ general creator
    association :creator, factory: :twitter_creator
    # association with users in general, and w/ this specific user
    association :user, factory: :twitter_user
  end

end
