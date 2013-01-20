class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :name
      t.text :description
      t.string :access
      t.boolean :collaboration
      t.integer :bank_bookmarks_count
      t.string :created_by

      t.timestamps
    end
  end
end
