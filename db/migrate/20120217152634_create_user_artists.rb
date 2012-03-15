class CreateUserArtists < ActiveRecord::Migration
  def self.up
    create_table :user_artists do |t|
      t.string :facebook_id
      t.string :facebook_name
      t.string :artist_name
      t.string :artist_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_artists
  end
end
