class Bank < ActiveRecord::Base
  attr_accessible :access, :collaboration, :description, :name, :type
  
  validates :access, :presence => true
  validates :name, :presence => true
 
  has_many :bank_files
  has_many :sound_files, :through => :bank_files
  has_many :luser_banks
  has_many :lusers, :through => :luser_banks
  has_many :bank_genres 
  has_many :genres, :through => :bank_genres
  
  
  def self.inherited(child)
  		child.instance_eval do
  			def model_name
  				Bank.model_name
  			end
  		end
  		super
  end
  
  
  def self.copy(bank, user)
    ActiveRecord::Base.transaction do
      copy = bank.dup
      copy.save!
      luser_bank = LuserBank.new
      luser_bank.bank_id = copy.id
      luser_bank.luser_id = user.id
      luser_bank.save!
    
      bank.sound_files.each do |s|
        new_s = s.dup
        new_s.wave = s.wave
        new_s.save!
        bank_file = BankFile.new
        bank_file.bank_id = copy.id
        bank_file.sound_file_id = new_s.id
        bank_file.save!
      end
    end
    
    true
  end
  
  def to_param
  		"#{id}-#{name.gsub(/[^a-z0-9]+/i, '-')}"
  end
  # def came_from
  #       self.name
  #   end
end
