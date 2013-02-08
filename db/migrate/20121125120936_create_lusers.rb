class CreateLusers < ActiveRecord::Migration
  def change
    create_table :lusers do |t|
      t.string      :name
      t.attachment  :profile
      t.integer     :luser_banks_count, :default => 0
      t.integer     :luser_Projects_count, :default => 0
      t.references  :user

      t.timestamps
    end
  end
end
