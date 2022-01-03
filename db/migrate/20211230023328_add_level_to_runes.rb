class AddLevelToRunes < ActiveRecord::Migration[6.1]
  def change
    add_column :runes, :level, :integer
  end
end
