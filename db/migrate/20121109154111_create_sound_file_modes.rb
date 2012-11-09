class CreateSoundFileModes < ActiveRecord::Migration
  def change
    create_table :sound_file_modes do |t|
      t.references :sound_file
      t.references :mode
      
      t.timestamps
    end
  end
end
