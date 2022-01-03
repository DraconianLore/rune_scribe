class CreateLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :levels do |t|
      t.bigint :structure_id
      t.integer :all
      t.integer :mind
      t.integer :power
      t.integer :death
      t.integer :life
      t.timestamps
    end
  end
end
