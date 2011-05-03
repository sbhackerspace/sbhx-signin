class AddIsThereToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :is_there, :boolean
  end

  def self.down
    remove_column :users, :is_there
  end
end
