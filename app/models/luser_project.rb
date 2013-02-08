class LuserProject < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :project_id, :presence => true, :numericality => { :only_integer => true }
  validates :luser_id, :presence => true, :numericality => { :only_integer => true }
  validates :role, :presence => true
  
  belongs_to :project
  belongs_to :luser, :counter_cache => true
  belongs_to :role
end
