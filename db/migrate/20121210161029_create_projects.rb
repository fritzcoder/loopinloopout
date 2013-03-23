class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string   :name
      t.string   :type, :default => "Project"
      t.text     :description
      t.text     :rules
      t.text     :prizes
      t.boolean  :leader_board, :default => false
      t.string   :genre
      t.boolean  :scoring, :default => false
      t.boolean  :voting, :default => false
      t.boolean  :invite, :default => false
      t.string   :access, :default => "Private"
      t.integer  :votes_count, :default => 0
      t.string   :created_by
      t.datetime :start
      t.datetime :end
  
      t.timestamps
    end
  end
end
