class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :o_id
      t.string  :object_type
      t.text    :description
      t.timestamps
    end
  end
end
