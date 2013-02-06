class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.references :project
      t.references :luser
      t.text       :comment

      t.timestamps
    end
  end
end
