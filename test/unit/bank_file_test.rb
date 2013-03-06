require 'test_helper'

class BankFileTest < ActiveSupport::TestCase
  test "should not save without user_id" do
     bank = Bank.new 
     assert !bank.save, "Saved the bank without a user_id"
  end
  
  test "should not save without bank_id" do
     bank = Bank.new 
     assert !bank.save, "Saved the bank without a bank_id"
  end
  
  test "should save sound to muliple banks" do
     BankFile.save_to_multiple_banks(1, [1,2,3])
     bankfiles = BankFile.find(:all, :conditions => {:sound_file_id => 1 })
     assert_equal(bankfiles.count, 3)
  end
  
end
