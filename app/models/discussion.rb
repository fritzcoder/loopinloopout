class Discussion < ActiveRecord::Base
  before_save :set_number
  attr_accessible :comment
  belongs_to :parent, :class_name => 'Discusson'
  has_many :replies, :class_name => 'Discussion', :foreign_key => 'parent_id'
  
  validates :project_id, :presence => true, :numericality => { :only_integer => true }
  validates :luser_id, :presence => true, :numericality => { :only_integer => true }
  validates :comment, :presence => true
  
  belongs_to :luser
  belongs_to :project
  
  private 
    def set_number
      number = Discussion.maximum("number")
      self.number = number + 1
    end
    
end
