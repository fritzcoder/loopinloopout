class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :luser_id
      t.integer :following_luser_id

      t.timestamps
    end
  end
end
