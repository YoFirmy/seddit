# frozen_string_literal: true

# creates posts
class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :message, null: false

      t.timestamps
    end
  end
end
