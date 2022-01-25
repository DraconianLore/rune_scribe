class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :colour
      t.string :background
      t.timestamps
    end
    create_table :runes_tags do |t|
      t.belongs_to :tag
      t.belongs_to :rune
    end
    create_table :structures_tags do |t|
      t.belongs_to :tag
      t.belongs_to :structure
    end
  end
end
