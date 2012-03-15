class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :facebook_id
      t.string :facebook_name
      t.string :facebook_gender
      t.string :facebook_email

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
