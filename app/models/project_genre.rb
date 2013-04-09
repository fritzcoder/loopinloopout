class ProjectGenre < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :project
  belongs_to :genre, :counter_cache => true
end
