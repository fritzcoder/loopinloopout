class BankBookmark < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :bank
  belongs_to :luser
end
