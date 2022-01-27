class AddFavToRunesAndStructures < ActiveRecord::Migration[6.1]
  def change
    add_column :structures, :fav_by, :string, array: :true, default: []
    add_column :runes, :fav_by, :string, array: :true, default: []

  end
end
