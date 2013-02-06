class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :project
      t.references :luser
      t.boolean    :email

      t.timestamps
    end
  end
end
