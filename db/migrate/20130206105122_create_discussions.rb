class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.references :project
      t.references :luser
      t.integer    :parent_id
      t.integer    :number, :default => 0
      t.text       :comment

      t.timestamps
    end
  end
end
