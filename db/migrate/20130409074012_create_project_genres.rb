class CreateProjectGenres < ActiveRecord::Migration
  def change
    create_table :project_genres do |t|
      t.references :project
      t.references :genre
      t.timestamps
    end
  end
end
