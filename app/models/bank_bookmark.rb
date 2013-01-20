class BankBookmark < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :bank, :counter_cache => true
  belongs_to :luser
end
