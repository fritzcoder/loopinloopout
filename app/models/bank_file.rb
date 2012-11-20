class BankFile < ActiveRecord::Base
  attr_accessible :sound_bank, :sound_file
  belongs_to :bank  
  belongs_to :sound_file
  
  #this is a convience method to assign 
  #multiple types to a sound object
  #pass the sound_file_id and an array of type ids
  def self.save_bank_types(sound_file_id, bank_ids)
    bank_ids.each do |id|
      bank = SoundFileMode.new
      bank.mode_id = id;
      bank.sound_file_id = sound_file_id;
      bank.save
    end
  end
end
