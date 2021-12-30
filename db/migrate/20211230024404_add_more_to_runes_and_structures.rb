class AddMoreToRunesAndStructures < ActiveRecord::Migration[6.1]
  def change
    # rune details
    add_column :runes, :trace, :string
    add_column :runes, :draw, :string
    add_column :runes, :target, :string
    # structure details
    add_column :structures, :trace, :string
    add_column :structures, :draw, :string
    add_column :structures, :target, :string
    add_column :structures, :strained, :boolean, :default => false
    add_column :structures, :dominant, :string
  end
end
