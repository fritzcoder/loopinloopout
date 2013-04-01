class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.string      :name
      t.text        :description
      t.attachment  :file
      t.attachment  :wave
      t.integer     :length, :default => 0
      t.integer     :bpm,:default => 0
      t.integer     :listen_count,:default => 0
      t.string      :created_by
      t.timestamps
    end
  end
end
