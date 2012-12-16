class CreateProjectFiles < ActiveRecord::Migration
  def change
    create_table :project_files do |t|
      t.references :sound_file
      t.references :project
      
      t.timestamps
    end
  end
end
