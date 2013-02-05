class Luser < ActiveRecord::Base
  attr_accessible :name, :assigable
  
  belongs_to :user
  has_many :luser_banks
  has_many :banks, :through => :luser_banks
  has_many :luser_projects
  has_many :projects, :through => :luser_projects

  def project_role(project)
    project = LuserProject.find(:first, :conditions => {:project_id => project.id, :luser_id => self.id })
    project.role.name
  end
  
end
