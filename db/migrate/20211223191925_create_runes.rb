class CreateRunes < ActiveRecord::Migration[6.1]
  def change
    create_table :runes do |t|
      t.string :name
      t.text :description
      t.string :house
      t.string :tags, array: true, default: []
      t.timestamps
    end
  end
end
