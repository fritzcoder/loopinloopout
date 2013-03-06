require 'test_helper'

class BankTest < ActiveSupport::TestCase
  test "should not save without access" do
     bank = Bank.new 
     assert !bank.save, "Saved the bank without a access"
  end
  
  test "should not save without name" do
     bank = Bank.new 
     assert !bank.save, "Saved the bank without a name"
  end
  
end