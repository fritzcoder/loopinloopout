class CreateBankGenres < ActiveRecord::Migration
  def change
    create_table :bank_genres do |t|
      t.references :bank
      t.references :genre
      t.timestamps
    end
  end
end
