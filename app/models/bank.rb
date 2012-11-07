class Bank < ActiveRecord::Base
  attr_accessible :access, :collaboration, :description, :name, :type
  has_many :bank_files
  
  def self.inherited(child)
  		child.instance_eval do
  			def model_name
  				Bank.model_name
  			end
  		end
  		super
  end
  def came_from
  	  self.name
  end
end
