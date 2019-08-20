class CreateAnime < ActiveRecord::Migration[6.0]
  def change
    create_table :anime do |t|
      t.string :name
      t.string :cover
      t.string :description

      t.timestamps
    end
  end
end
