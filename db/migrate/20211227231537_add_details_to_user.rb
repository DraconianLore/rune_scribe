class AddDetailsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :level, :integer, default: 1
    add_column :users, :house, :string, default: 'None'
    add_column :users, :theme, :string
  end
end
