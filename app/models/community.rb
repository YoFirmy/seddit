# frozen_string_literal: true

# Community Model
class Community < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :memberships
  has_many :users, through: :memberships
  validates :name, uniqueness: true

  def to_param
    name
  end
end
