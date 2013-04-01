class Clip < ActiveRecord::Base
  attr_accessible :file, :name, :description
  has_attached_file :file
  has_attached_file :wave , :styles => { :medium => "900x40!", :thumb => "300x19!" }
end
