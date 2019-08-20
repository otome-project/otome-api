class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :profile_picture
      t.string :favorite_anime
      t.text :bio

      t.timestamps
    end
  end
end
