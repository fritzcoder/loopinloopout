class SoundFileType < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :sound_file
  belongs_to :sound_type
end
