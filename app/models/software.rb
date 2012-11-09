class Software < ActiveRecord::Base
  attr_accessible :name
  has_many :sound_file_softwares
  has_many :sound_files, :through => :sound_file_softwares
end
