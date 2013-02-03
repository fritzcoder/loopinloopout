class Project < ActiveRecord::Base
  #Validations 
  validates :name, :presence => true
  validates :description, :presence => true
  validates :access, :presence => true
  validates :created_by, :presence => true
  validates :type, :presence => true
  #end validations
  
  
  has_many :luser_projects
  has_many :lusers, :through => :luser_projects
  has_many :votes
  has_many :project_scores
  has_many :project_files
  scope :public, :conditions => { :access => 'Public' }
  attr_accessible :name, :description, :access, :rules, :prizes, :start, :end, :type
  
  #override the model_name method so it always returns
  #the method name of the parent and not the child name
  #Why? This is so we can use one controller and form_for
  #with out issue
  def self.inherited(child)
  		child.instance_eval do
  			def model_name
  				Project.model_name
  			end
  		end
  		super
  end
  
  # def came_from
  #       self.name
  # end
  
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
  
  def total_score
    total = 0
    self.project_scores.each do |point|
      total = total + point.weight
    end
    total 
  end
  
end