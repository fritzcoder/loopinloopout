class SoundFileScore < ActiveRecord::Base
  attr_accessible :sound_file_id, :score, :comment
  
  validates :sound_file_id, :presence => true, :numericality => { :only_integer => true }
  validates :project_id, :presence => true, :numericality => { :only_integer => true }
  validates :project_score_id, :presence => true, :numericality => { :only_integer => true }
  validates :score, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  
  
  belongs_to :sound_file
  belongs_to :project
  belongs_to :project_score
end
