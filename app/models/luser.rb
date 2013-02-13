class Luser < ActiveRecord::Base
  attr_accessible :name, :assigable
  
  belongs_to :user
  has_many :luser_banks
  has_many :banks, :through => :luser_banks
  has_many :luser_projects
  has_many :projects, :through => :luser_projects
  has_many :luser_follows, :class_name => "Follow", :foreign_key => "luser_id"
  has_many :following_lusers, :class_name => "Follow", :foreign_key => "following_luser_id"
  has_many :discussions

  def project_role(project)
    project = LuserProject.find(:first, :conditions => {:project_id => project.id, :luser_id => self.id })
    project.role.name
  end
  
  def following(user)
    f = Follow(:first, :conditions => [:luser_id => self.id, :following_luser_id => user.luser.id])
    if f != nil 
      return true
    end
    
    false
  end
  
end
