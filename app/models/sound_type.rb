class SoundType < ActiveRecord::Base
  attr_accessible :name
  has_many :sound_file_types
  has_many :sound_files, :through => :sound_file_types
end
