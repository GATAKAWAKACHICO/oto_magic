class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :organizer
      t.string :participant1
      t.string :participant2
      t.string :participant3

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
