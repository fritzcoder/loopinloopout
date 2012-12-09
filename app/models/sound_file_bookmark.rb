class SoundFileBookmark < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :sound_file
  belongs_to :luser
end
