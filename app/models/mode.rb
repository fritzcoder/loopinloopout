class Mode < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true
  
  has_many :sound_file_modes
  has_many :sound_files, :through => :sound_file_modes
end
