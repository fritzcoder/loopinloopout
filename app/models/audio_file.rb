class AudioFile < ActiveRecord::Base
  attr_accessible :name, :description, :audio, :length, :bpm, :type
  has_attached_file :audio
  
  before_post_process :skip_for_audio

  def skip_for_audio
    ! %w(audio/mpeg application/mpeg).include?(audio_content_type)
  end
end
