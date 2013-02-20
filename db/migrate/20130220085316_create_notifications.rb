class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :luser
      t.string     :type
      t.integer    :entity_id
      t.string     :action
      t.text       :message
      t.boolean    :read

      t.timestamps
    end
  end
end
