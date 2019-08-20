class CreateAnimeLists < ActiveRecord::Migration[6.0]
  def change
    create_table :anime_lists do |t|
      t.integer :anime_id
      t.integer :user_id
      t.integer :status
      t.integer :rating

      t.timestamps
    end
  end
end
