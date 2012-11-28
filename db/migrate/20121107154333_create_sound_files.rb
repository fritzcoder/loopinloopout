class CreateSoundFiles < ActiveRecord::Migration
  def change
    create_table :sound_files do |t|
      t.string      :name
      t.text        :description
      t.attachment  :file
      t.attachment  :wave
      t.attachment  :preview
      t.integer     :length
      t.integer     :bpm
      t.string      :type
      t.string      :created_by

      t.timestamps
    end
  end
end
