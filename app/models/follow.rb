class Follow < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :luser, :class => "Luser"
  belongs_to :following_luser, :class => "Luser"
end
