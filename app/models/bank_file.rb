class BankFile < ActiveRecord::Base
  attr_accessible :sound_bank, :sound_file
  
  validates :bank_id, :presence => true, :numericality => { :only_integer => true }
  validates :sound_file_id, :presence => true, :numericality => { :only_integer => true }
  
  
  belongs_to :bank  
  belongs_to :sound_file
  
  #this is a convience method to assign a soundfile to multiple banks
  #pass the sound_file_id and an array of banks ids
  def self.save_bank_types(sound_file_id, bank_ids)
    bank_ids.each do |id|
      bank = BankFile.new
      bank.bank_id = id;
      bank.sound_file_id = sound_file_id;
      bank.save
    end
  end
end
