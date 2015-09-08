class AddProfileToUser < ActiveRecord::Migration
  def change
    add_column :users, :Profile, :string
  end
end
