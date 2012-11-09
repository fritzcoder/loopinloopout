class CreateSoundFileTypes < ActiveRecord::Migration
  def change
    create_table :sound_file_types do |t|
      t.references :sound_type
      t.references :sound_file
      t.timestamps
    end
  end
end
