class AddAdditionalToRunesAndStructures < ActiveRecord::Migration[6.1]
  def change
    add_column :runes, :additional, :text
    add_column :structures, :additional, :text
    add_column :structures, :number_of_runes, :integer
    add_column :structures, :discovered, :boolean, :default => false
  end
end
