class Community < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates_uniqueness_of :name
end
