class SoundFileScore < ActiveRecord::Base
  attr_accessible :sound_file_id, :score, :comment
  belongs_to :sound_file
  belongs_to :project
  belongs_to :project_score
end
