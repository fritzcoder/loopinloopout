class Subscription < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :project_id, :presence => true, :numericality => { :only_integer => true }
  validates :luser_id, :presence => true, :numericality => { :only_integer => true }
  
  belongs_to :luser
  belongs_to :project
end
