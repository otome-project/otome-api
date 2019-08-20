class Change < ActiveRecord::Migration[6.0]
  def change
    rename_table :anime, :animes
  end
end
