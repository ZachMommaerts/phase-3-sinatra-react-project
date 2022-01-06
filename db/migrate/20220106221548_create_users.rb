class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :usernames do |t|
    t.string :name
    t.integer :username_id
    end
  end
end
