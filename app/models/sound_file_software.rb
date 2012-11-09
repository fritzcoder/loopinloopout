class SoundFileSoftware < ActiveRecord::Base
  attr_accessible :notes
  belongs_to :sound_file
  belongs_to :software
end
