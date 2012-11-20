class SoundFileType < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :sound_file
  belongs_to :sound_type
  
  #this is a convience method to assign 
  #multiple types to a sound object
  #pass the sound_file_id and an array of type ids
  def self.save_file_types(sound_file_id, sound_type_ids)
    sound_type_ids.each do |id|
      st = SoundFileType.new
      st.sound_type_id = id;
      st.sound_file_id = sound_file_id;
      st.save
    end
  end
end
