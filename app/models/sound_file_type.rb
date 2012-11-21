class SoundFileType < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :sound_file
  belongs_to :sound_type
  
  #this is a convience method to assign 
  #multiple types to a sound object
  #pass the sound_file_id and an array of type ids
  def self.save_file_types(sound_file_id, sound_type_ids)
    #logger.debug "---------- in loop #{sound_type_ids}----------"
    #count_it = 0
    sound_type_ids.each do |id|
      #logger.debug "---------- value: #{id} ----------"
      if(id != nil and id != "")
        st = SoundFileType.new
        st.sound_type_id = id;
        st.sound_file_id = sound_file_id;
        st.save
        #count_it = count_it + 1;
      end
    end
    #logger.debug "---------- loops: #{count_it} ----------"
  end
end
