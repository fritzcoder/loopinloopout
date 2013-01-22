class CreateProjectScores < ActiveRecord::Migration
  def change
    create_table :project_scores do |t|

      t.timestamps
    end
  end
end
