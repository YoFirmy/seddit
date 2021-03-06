# frozen_string_literal: true

# Make sure posts have a user
class AddUserRefToPost < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :user, null: false, foreign_key: true
  end
end
