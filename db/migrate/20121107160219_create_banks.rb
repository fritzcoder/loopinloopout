class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :name
      t.text :description
      t.string :access
      t.boolean :collaboration, :default => false
      t.boolean :allow_copy, :default => false
      t.integer :bank_bookmarks_count, :default => 0
      t.string :created_by

      t.timestamps
    end
  end
end
