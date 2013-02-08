class Discussion < ActiveRecord::Base
  attr_accessible :comment
  validates :project_id, :presence => true, :numericality => { :only_integer => true }
  validates :luser_id, :presence => true, :numericality => { :only_integer => true }
  validates :comment, :presence => true
  
  belongs_to :luser
  belongs_to :project
  
end
