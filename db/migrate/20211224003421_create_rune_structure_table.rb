class CreateRuneStructureTable < ActiveRecord::Migration[6.1]
  def change
    create_table :runes_structures do |t|
      t.belongs_to :structure
      t.belongs_to :rune
      t.timestamps
    end
  end
end
