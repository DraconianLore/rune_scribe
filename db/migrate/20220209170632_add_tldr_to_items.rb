class AddTldrToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :runes, :tldr, :text, default: ''
    add_column :structures, :tldr, :text, default: ''
  end
end
