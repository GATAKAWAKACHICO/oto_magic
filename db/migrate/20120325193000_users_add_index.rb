class UsersAddIndex < ActiveRecord::Migration
  def self.up
    add_index :users, :facebook_id, :unique => true
  end

  def self.down
    remove_index :users, :facebook_id
  end
end
