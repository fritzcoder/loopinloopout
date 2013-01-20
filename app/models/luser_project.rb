class LuserProject < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :project
  belongs_to :luser, :counter_cache => true
end
