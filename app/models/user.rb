# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :memberships
  has_many :communities, through: :memberships
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
