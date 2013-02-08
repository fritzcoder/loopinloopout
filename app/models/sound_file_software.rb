class SoundFileSoftware < ActiveRecord::Base
  attr_accessible :notes
  
  validates :sound_file_id, :presence => true, :numericality => { :only_integer => true }
  validates :software_id, :presence => true, :numericality => { :only_integer => true }
  
  belongs_to :sound_file
  belongs_to :software
  
  #this is a convience method to assign 
  #multiple types to a sound object
  #pass the sound_file_id and an array of type ids
  def self.save_software_types(sound_file_id, software_ids)
    software_ids.each do |id|
      software = SoundFileSoftware.new
      software.software_id = id;
      software.sound_file_id = sound_file_id;
      software.save
    end
  end
  
end
