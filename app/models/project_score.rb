class ProjectScore < ActiveRecord::Base
   attr_accessible :point, :description, :weight
   belongs_to :project
   has_many :project_scores
end
