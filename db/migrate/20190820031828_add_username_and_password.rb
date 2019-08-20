class AddUsernameAndPassword < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :login, :string
    add_column :users, :password, :string
    add_column :users, :gender, :string
    add_column :users, :interest, :string
  end
end
