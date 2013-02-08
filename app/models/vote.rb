class Vote < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :sound_file_id, :presence => true, :numericality => { :only_integer => true }
  validates :luser_id, :presence => true, :numericality => { :only_integer => true }
  validates :project_id, :presence => true, :numericality => { :only_integer => true }
  
  belongs_to :sound_file, :counter_cache => true
  belongs_to :luser
  belongs_to :project, :counter_cache => true
end
