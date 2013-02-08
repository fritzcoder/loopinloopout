class BankBookmark < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :bank_id, :presence => true, :numericality => { :only_integer => true }
  validates :luser_id, :presence => true, :numericality => { :only_integer => true }
  
  belongs_to :bank, :counter_cache => true
  belongs_to :luser
end
