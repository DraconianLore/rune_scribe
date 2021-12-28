class AddDetailsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :level, :integer, default: 1
    add_column :users, :house, :string, default: 'None'
  end
end
