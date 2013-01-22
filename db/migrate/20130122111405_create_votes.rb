class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :project
      t.references :sound_file
      t.references :luser
      t.timestamps
    end
  end
end
