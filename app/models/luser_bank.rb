class LuserBank < ActiveRecord::Base
  belongs_to :bank
  belongs_to :luser, :counter_cache => true
end
