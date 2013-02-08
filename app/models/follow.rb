class Follow < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :luser_id, :presence => true
  validates :following_luser_id, :presence => true
  
  #belongs_to :luser, :class => "Luser"
  #belongs_to :following_luser, :class => "Luser"
end
