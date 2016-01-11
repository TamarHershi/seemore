class Video < ActiveRecord::Base
  belongs_to :creator
  validates :name, :uri, :embed, :posted_at,
   presence: true

end
