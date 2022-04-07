class CreateCombinations < ActiveRecord::Migration[6.1]
  def change
    create_table :combinations do |t|
      t.integer :structure_size                 # how many runes in the structure
      t.integer :rune1                          # rune 1 ID if a two rune strucure
      t.integer :rune2                          # rune 2 ID if a two rune structure
      t.integer :structure1                     # structure 1 ID if > 2 runes
      t.integer :structure2                     # structure 2 ID if > 2 runes
      t.intiger :modifier                       # current modifier to rolls to discover
      t.string :result, default => 'unknown'    # result for checks: unknown, not found, found
      t.integer :recent, default => 0           # keep the last 5 highlighted as recent (-1 to all above 0 when one is discovered)
      t.integer :structure                      # structure ID - if the structure exists AND is found
      t.timestamps
    end
    add_column :users, :last_selected, :integer # the last/current item selected by the user
  end
end
