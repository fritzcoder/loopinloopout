class CreateLusers < ActiveRecord::Migration
  def change
    create_table :lusers do |t|
      t.string :name
      t.attachment  :profile
      t.references :user

      t.timestamps
    end
  end
end
