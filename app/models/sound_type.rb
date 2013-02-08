class SoundType < ActiveRecord::Base
  attr_accessible :name, :sound_type_id
  
  validates :name, :presence => true
  
  has_many :sound_file_types
  has_many :sound_files, :through => :sound_file_types
end
