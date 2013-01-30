class CreateSoundFileScores < ActiveRecord::Migration
  def change
    create_table :sound_file_scores do |t|
      t.references  :project
      t.references  :sound_file
      t.references  :project_score
      t.integer     :score, :default => 0
      t.text        :comment
      
      t.timestamps
    end
  end
end
