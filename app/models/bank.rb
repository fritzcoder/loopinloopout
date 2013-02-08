class Bank < ActiveRecord::Base
  attr_accessible :access, :collaboration, :description, :name, :type
  validates :access, :presence => true
  validates :name, :presence => true
  validates :type, :presence => true
 
 
  has_many :bank_files
  has_many :sound_files, :through => :bank_files
  has_many :luser_banks
  has_many :lusers, :through => :luser_banks
  
  def self.inherited(child)
  		child.instance_eval do
  			def model_name
  				Bank.model_name
  			end
  		end
  		super
  end
  
  # def came_from
  #       self.name
  #   end
end
