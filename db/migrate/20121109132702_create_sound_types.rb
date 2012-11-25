class CreateSoundTypes < ActiveRecord::Migration
  def change
    create_table :sound_types do |t|
      t.string :name
      t.references :sound_type
      t.timestamps
    end
    sound_type = SoundType.create :name => 'Piano/Keys'
    SoundType.create :name => 'Grand Piano', :sound_type_id = sound_type.id
  end
end
