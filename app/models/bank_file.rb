class BankFile < ActiveRecord::Base
  attr_accessible :sound_bank, :sound_file
  belongs_to :bank  
  belongs_to :sound_file
end
