class Post < ApplicationRecord
  belongs_to :user
  belongs_to :community
  validates :message, presence: true
end
