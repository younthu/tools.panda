# This migration comes from panda (originally 20211106041355)
class Rpush210Updates < ActiveRecord::Migration[5.0]
  def self.up
    add_column :rpush_notifications, :url_args, :text, null: true
    add_column :rpush_notifications, :category, :string, null: true
  end

  def self.down
    remove_column :rpush_notifications, :url_args
    remove_column :rpush_notifications, :category
  end
end
