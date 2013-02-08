class LuserBank < ActiveRecord::Base
  validates :bank_id, :presence => true, :numericality => { :only_integer => true }
  validates :luser_id, :presence => true, :numericality => { :only_integer => true }
  
  
  belongs_to :bank
  belongs_to :luser, :counter_cache => true
end
