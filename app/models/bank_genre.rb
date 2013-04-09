class BankGenre < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :bank
  belongs_to :genre, :counter_cache => true
end
