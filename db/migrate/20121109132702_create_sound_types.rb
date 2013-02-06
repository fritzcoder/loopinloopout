class CreateSoundTypes < ActiveRecord::Migration
  def change
    create_table :sound_types do |t|
      t.string :name
      t.references :sound_type
      t.timestamps
    end
    
    sound_type = SoundType.create :name => "Piano/Keys"
    SoundType.create :name => "Grand Piano", :sound_type_id => sound_type.id
    SoundType.create :name => "Upright Piano", :sound_type_id => sound_type.id
    SoundType.create :name => "Electric Piano", :sound_type_id => sound_type.id
    SoundType.create :name => "Upright Piano", :sound_type_id => sound_type.id
    
    sound_type = SoundType.create :name => "Lead Snyth"
    SoundType.create :name => "Stab", :sound_type_id => sound_type.id
    
    sound_type = SoundType.create :name => "Pad Snyth"
    SoundType.create :name => "Slow", :sound_type_id => sound_type.id
    
    sound_type = SoundType.create :name => "Guitar"
    SoundType.create :name => "Metal", :sound_type_id => sound_type.id
    SoundType.create :name => "Death", :sound_type_id => sound_type.id
    SoundType.create :name => "Jazz", :sound_type_id => sound_type.id
    
    sound_type = SoundType.create :name => "Horns"
    SoundType.create :name => "Brass", :sound_type_id => sound_type.id
    
    
  end
end
