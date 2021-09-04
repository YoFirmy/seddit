# frozen_string_literal: true

class Community < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, uniqueness: true
end
