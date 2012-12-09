class CreateBankBookmarks < ActiveRecord::Migration
  def change
    create_table :bank_bookmarks do |t|
      t.references :luser
      t.references :bank
      
      t.timestamps
    end
  end
end
