class AudioFile < ActiveRecord::Base
  attr_accessible :name, :description, :audio, :length, :bpm, :type
end
