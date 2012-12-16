class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string   :name
      t.string   :type
      t.text     :description
      t.string   :access
      t.boolean  :collaboration
      t.string   :created_by
      t.datetime :start
      t.datetime :end
      t.string   :access 
      
      t.timestamps
    end
  end
end
