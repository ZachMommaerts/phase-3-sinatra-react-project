class CreateLeaderboard < ActiveRecord::Migration[6.1]
  def change
    create_table :score do |t|
      t.integer :score
      t.integer :username_id
      t.timestamps
    end
  end
end
