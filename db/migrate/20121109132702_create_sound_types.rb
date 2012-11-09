class CreateSoundTypes < ActiveRecord::Migration
  def change
    create_table :sound_types do |t|
      t.string :name
      t.references :sound_type
      t.timestamps
    end
  end
end
