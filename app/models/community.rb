# frozen_string_literal: true

# Community Model
class Community < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, uniqueness: true

  def to_param
    name
  end
end
