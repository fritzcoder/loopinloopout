class CreateLuserBanks < ActiveRecord::Migration
  def change
    create_table :luser_banks do |t|
      t.references :luser
      t.references :bank

      t.timestamps
    end
  end
end
