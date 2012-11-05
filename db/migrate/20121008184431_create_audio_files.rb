class CreateAudioFiles < ActiveRecord::Migration
  def change
    create_table :audio_files do |t|
      t.string      :name
      t.text        :description
      t.attachment  :audio
      t.attachment  :wave
      t.integer     :length
      t.integer     :bpm
      t.string      :type
      t.timestamps
    end
  end
end
