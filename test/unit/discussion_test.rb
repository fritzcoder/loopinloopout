require 'test_helper'

class DiscussionTest < ActiveSupport::TestCase
  test "should not save without user_id" do
     discussion = Discussion.new 
     assert !discussion.save, "Saved the discussion without a user_id"
  end
  
  test "should not save without project_id" do
     discussion = Discussion.new 
     assert !discussion.save, "Saved the discussion without a project_id"
  end
end
