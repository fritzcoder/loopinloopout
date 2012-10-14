class CreateAudioFiles < ActiveRecord::Migration
  def change
    create_table :audio_files do |t|
      t.string  :name
      t.text    :description
      t.binary  :audio
      t.integer :length
      t.integer :bpm
      t.string  :type
      t.timestamps
    end
  end
end
