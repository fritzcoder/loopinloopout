class CreateProjectScores < ActiveRecord::Migration
  def change
    create_table :project_scores do |t|
      t.references  :project
      t.string      :point
      t.text        :description
      t.integer     :weight
      
      t.timestamps
    end
  end
end
