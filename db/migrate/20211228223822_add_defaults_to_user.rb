class AddDefaultsToUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :theme, :string, :default => 'Mind'
    change_column :users, :dungeonmaster, :boolean, :default => false
  end
end
