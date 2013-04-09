class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string  :name
      t.integer :project_genres_count, :default => 0
      t.integer :bank_genres_count,:default => 0
      t.timestamps
    end
  end
end
