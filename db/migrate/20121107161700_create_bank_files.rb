class CreateBankFiles < ActiveRecord::Migration
  def change
    create_table :bank_files do |t|
      t.references :sound_file
      t.references :bank

      t.timestamps
    end
  end
end
