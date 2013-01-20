class SoundFileBookmark < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :sound_file, :counter_cache => true
  belongs_to :luser
end
