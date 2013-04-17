
class SoundFile < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true
  validates :created_by, :presence => true
  validates :type, :presence => true
  validate  :file, :presence => true
  #validates :bpm, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  
  attr_accessible :name, :description, :length, :file, :preview, :bpm, :type
  attr_readonly :wave, :type
  
  has_many    :bank_files
  has_many    :banks, :through => :bank_files
  has_many    :sound_file_modes
  has_many    :modes, :through => :sound_file_modes
  has_many    :sound_file_softwares
  has_many    :softwares, :through => :sound_file_softwares
  has_many    :sound_file_types 
  has_many    :sound_types, :through => :sound_file_types
  has_many    :votes
  has_many    :sound_file_scores
  
  has_attached_file :file
  has_attached_file :wave , :styles => { :medium => "900x40!", :thumb => "300x19!" }
  has_attached_file :preview
  has_attached_file :thumbnail , :styles => { :medium => "900x40!", :thumb => "300x19!" }
  
  #before_post_process :skip_for_audio
  #def skip_for_audio
  #  ! %w(audio/mpeg application/mpeg).include?(file_content_type)
  #end
  
  def self.inherited(child)
  		child.instance_eval do
  			def model_name
  				SoundFile.model_name
  			end
  		end
  		super
  end

  def self.copy_to_bank(sound_file, bank)
    ActiveRecord::Base.transaction do
      copy_sound = sound_file.dup
      copy_sound.wave = sound_file.wave
      copy_sound.file = sound_file.file
      copy_sound.save!
      bank_file = BankFile.new 
      bank_file.bank_id = bank.id
      bank_file.sound_file_id = copy_sound.id
      bank_file.save!
    end
  end
  
  def audio
    audio_types = ['mp3', 'aiff', 'wav']
    return audio_types.index(self.file_type);
  end
  
  def file_type
    file_file_name.split(".")[1]
  end 
  
  def score
    total = 0.0
    self.sound_file_scores.each do |score|
      total = total + score.score
    end
    total
  end  
  
  def score_with_votes(total_votes, vote_weight)
    total = 0.0
    self.sound_file_scores.each do |score|
      total = total + score.score
    end
    popularity = self.votes_count / total_votes * vote_weight
    total + popularity
  end

end
