class Luser < ActiveRecord::Base
  attr_accessible :name, :location, :about, :profile, :battle_station, :gear
  has_attached_file :profile, :styles => { :medium => "300x300>", :thumb => "23x22>" }
  has_attached_file :battle_station, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  belongs_to :user
  has_many :luser_banks
  has_many :banks, :through => :luser_banks
  has_many :luser_projects
  has_many :projects, :through => :luser_projects
  has_many :luser_follows, :class_name => "Follow", :foreign_key => "luser_id"
  has_many :following_lusers, :class_name => "Follow", :foreign_key => "following_luser_id"
  has_many :discussions
  has_many :subscriptions
  has_many :sound_comments, :inverse_of => :luser

  def project_role(project)
    project = LuserProject.find(:first, :conditions => {:project_id => project.id, :luser_id => self.id })
    
    if project == nil
      return nil
    end 
      
    project.role.name
  end
  
  def following(username)
    luser = Luser.find(:first, :conditions => { :name => username })
    f = Follow.find(:first, :conditions => {:luser_id => self.id, :following_luser_id => luser.id})
    f
  end
  
end
