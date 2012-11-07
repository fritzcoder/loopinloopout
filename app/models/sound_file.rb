class SoundFile < ActiveRecord::Base
  attr_accessible :name, :description, :length, :file, :preview, :bpm
  attr_readonly :wave, :type
  
  has_attached_file :file
  has_attached_file :wave
  has_attached_file :preview
  
  has_many :bank_file
  
  before_post_process :skip_for_audio

  def skip_for_audio
    ! %w(audio/mpeg application/mpeg).include?(audio_content_type)
  end
  
end
