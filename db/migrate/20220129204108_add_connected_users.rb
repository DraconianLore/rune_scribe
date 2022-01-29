class AddConnectedUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :connected, :boolean, default: false
  end
end
