class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string   :name
      t.string   :type
      t.text     :description
      t.text     :rules
      t.text     :prizes
      t.boolean  :leader_board
      t.boolean  :scoring
      t.boolean  :voting
      t.boolean  :invite
      t.string   :access
      t.string   :created_by
      t.datetime :start
      t.datetime :end
  
      t.timestamps
    end
  end
end
