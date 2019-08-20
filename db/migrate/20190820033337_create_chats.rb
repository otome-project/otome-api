class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.text :message
      t.integer :sent_id
      t.integer :received_id
      t.integer :message_status
      t.integer :room_id

      t.timestamps
    end
  end
end
