# frozen_string_literal: true

# This migration is to prevent multiple Communities of the same name being created
class AddNameIndexToCommunities < ActiveRecord::Migration[6.1]
  def change
    add_index :communities, :name, unique: true
  end
end
