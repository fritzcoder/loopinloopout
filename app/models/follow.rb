class Follow < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :luser_id, :presence => true
  validates :following_luser_id, :presence => true
  
  belongs_to :luser
  belongs_to :following_luser, :class_name => "Luser"
end
