class Luser < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  has_many :luser_banks
  has_many :banks, :through => :luser_banks
  has_many :luser_projects
  has_many :projects, :through => :luser_projects
end
