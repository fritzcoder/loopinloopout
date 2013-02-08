class ProjectFile < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :sound_file_id, :presence => true,:numericality => { :only_integer => true }
  validates :project_id, :presence => true,:numericality => { :only_integer => true }
  
  
  belongs_to :sound_file
  belongs_to :project
  
end
