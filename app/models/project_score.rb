class ProjectScore < ActiveRecord::Base
   attr_accessible :point, :description, :weight
   
   validates :point, :presence => true
   validates :description, :presence => true
   validates :weight, :presence => true, :numericality => { :only_integer => true }
   validates :project_id, :presence => true, :numericality => { :only_integer => true }
   
   belongs_to :project
   has_many :project_scores
end
