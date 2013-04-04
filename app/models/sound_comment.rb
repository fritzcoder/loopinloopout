class SoundComment < ActiveRecord::Base
  attr_accessible :comment, :time
  belongs_to :luser, :inverse_of => :sound_comments
  belongs_to :sound_file, :counter_cache => true
end
