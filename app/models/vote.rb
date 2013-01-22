class Vote < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :sound_file, :counter_cache => true
  belongs_to :luser
  belongs_to :project, :counter_cache => true
end
