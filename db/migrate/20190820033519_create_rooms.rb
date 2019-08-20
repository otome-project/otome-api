class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :channel_path
      t.integer :status
      t.string :users_id

      t.timestamps
    end
  end
end
