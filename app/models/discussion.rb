class Discussion < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :luser
  belongs_to :project
end
