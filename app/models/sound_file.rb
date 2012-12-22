
class SoundFile < ActiveRecord::Base
  attr_accessible :name, :description, :length, :file, :preview, :bpm, :type
  attr_readonly :wave, :type
  has_many    :bank_files
  has_many    :banks, :through => :bank_files
  has_many    :sound_file_modes
  has_many    :modes, :through => :sound_file_modes
  has_many    :sound_file_softwares
  has_many    :softwares, :through => :sound_file_softwares
  has_many    :sound_file_types 
  has_many    :sound_types, :through => :sound_file_types
  
  has_attached_file :file
  has_attached_file :wave , :styles => { :medium => "800x50!", :thumb => "300x19!" }
  has_attached_file :preview
  has_attached_file :thumbnail , :styles => { :medium => "800x50!", :thumb => "300x19!" }
  
  #before_post_process :skip_for_audio

  #def skip_for_audio
  #  ! %w(audio/mpeg application/mpeg).include?(file_content_type)
  #end
  
  def self.inherited(child)
  		child.instance_eval do
  			def model_name
  				SoundFile.model_name
  			end
  		end
  		super
  end
  
  def came_from
  	  self.name
  end
  
  def audio
    audio_types = ['mp3', 'aiff', 'wav']
    return audio_types.index(self.file_type);
  end
  
  def file_type
    file_file_name.split(".")[1]
  end 

end
