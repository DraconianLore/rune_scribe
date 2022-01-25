class CreateStructures < ActiveRecord::Migration[6.1]
  def change
    create_table :structures do |t|
      t.string :name
      t.text :description
      t.string :tags, array: true, default: []
      t.string :sub_structures, array: true, default: []
      t.timestamps
    end
  end
end
