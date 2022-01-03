class ChangeStructureTargetToArray < ActiveRecord::Migration[6.1]
  def change
    remove_column :runes, :target, :string
    remove_column :structures, :target, :string
    add_column :runes, :target, :string, array: true, default: []
    add_column :structures, :target, :string, array: true, default: []
  end
end
