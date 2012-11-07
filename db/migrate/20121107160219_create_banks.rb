class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :name
      t.text :description
      t.string :type
      t.string :access
      t.boolean :collaboration

      t.timestamps
    end
  end
end
