class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
    t.string :songname
    t.string :artist
    t.integer :currentposition
    end
  end
end
