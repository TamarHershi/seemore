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
    provider "twitter"
    uid "fdsfdsfs"
  end

  factory :vimeo_creator, class: Creator do
    name "Nancy"
    description "VIMEO!!"
    profile_pic "www.profilepic.com"
    provider "vimeo"
    uid "1ab3da5"
  end

  # session factories

  # video factories
  factory :video do
    posted_at "2013-07-19T01:31:12+00:00"
    uri "/user/video"
    name "The Best Video"
    embed "www.embed.com"
    description "I am a video"
    vimeo_id "32515"
    association :creator, factory: :vimeo_creator
  end

  factory :tweet do
    posted_at "2016-01-14 09:15:55 +0000"
    uid "687563783829635072"
    association :creator, factory: :twitter_creator
  end

  # category factories
  factory :category do
    association :creator, factory: :twitter_creator
    association :user, factory: :twitter_user
  end

end
