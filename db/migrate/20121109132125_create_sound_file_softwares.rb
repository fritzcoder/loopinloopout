class CreateSoundFileSoftwares < ActiveRecord::Migration
  def change
    create_table :sound_file_softwares do |t|
      t.text :notes
      t.references :sound_file
      t.references :software

      t.timestamps
    end
  end
end
