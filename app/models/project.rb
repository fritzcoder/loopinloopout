class Project < ActiveRecord::Base
  has_many :luser_projects
  has_many :lusers, :through => :luser_projects
  scope :public, :conditions => { :access => 'Public' }
  attr_accessible :name, :description, :access, :rules, :prizes, :start, :end, :type
  
  def self.inherited(child)
  		child.instance_eval do
  			def model_name
  				Project.model_name
  			end
  		end
  		super
  end
  
  def came_from
  	  self.name
  end
  
  #def lusers
  #  self.luser_projects.map {|p| p.luser }
  #end
  
  def user_access(user)
    if self.created_by == user.luser.name
      "Manager"
    else
      self.lusers.each do |luser|
        if luser.name == user.luser.name
          return "Contributor"
        end
      end
    end
  end
  
end