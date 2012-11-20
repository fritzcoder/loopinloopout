class SoundFileMode < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :sound_file
  belongs_to :mode
  
  
  #this is a convience method to assign 
  #multiple types to a sound object
  #pass the sound_file_id and an array of type ids
  def self.save_mode_types(sound_file_id, mode_ids)
    mode_ids.each do |id|
      mode = SoundFileMode.new
      mode.mode_id = id;
      mode.sound_file_id = sound_file_id;
      mode.save
    end
  end
end
