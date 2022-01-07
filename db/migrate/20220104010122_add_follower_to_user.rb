class AddFollowerToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :follower, :string
  end
end
