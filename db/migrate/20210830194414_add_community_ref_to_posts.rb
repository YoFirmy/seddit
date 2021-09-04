# frozen_string_literal: true

# allows posts to be posted to a community
class AddCommunityRefToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :community, null: false, foreign_key: true
  end
end
