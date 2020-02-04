class Story < ApplicationRecord
  belongs_to :user
  has_many :user_favourite_stories
end
