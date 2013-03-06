require 'test_helper'

class BankBookmarkTest < ActiveSupport::TestCase
  fixtures :all
  
  test "should not save without user_id" do
     bank_bookmark = BankBookmark.new 
     assert !bank_bookmark.save, "Saved the bookmark without a user_id"
  end
  
  test "should not save without bank_id" do
     bank_bookmark = BankBookmark.new 
     assert !bank_bookmark.save, "Saved the bookmark without a bank_id"
  end
  
  
  test "counter cache updating: Bank" do
    bank = Bank.find(:first, :conditions => {:name => "Bank 1"})
    user = User.find(:first, :conditions => {:email => "test1@test.com"})
    bank_bookmark_counter_cache_before = bank.bank_bookmarks_count
    new_bookmark = BankBookmark.new
    
    new_bookmark.luser_id = user.id
    new_bookmark.bank_id = bank.id
    
    assert new_bookmark.save, "Did not save bookmark." 
    
    bank = Bank.find(:first, :conditions => {:name => "Bank 1"})
    
    assert (bank.bank_bookmarks_count >  bank_bookmark_counter_cache_before), 
              "Bank book mark did not increment: " + bank.bank_bookmarks_count.to_s
    
  end
  
end
