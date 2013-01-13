class CreateLuserProjects < ActiveRecord::Migration
  def change
    create_table :luser_projects do |t|
      t.references :project
      t.references :luser
      t.references :role
      
      t.timestamps
    end
  end
end
