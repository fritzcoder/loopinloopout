require 'test_helper'

class CollaborationTest < ActiveSupport::TestCase
  test "model_name should return Project" do
      assert_equal(Collaboration.model_name, "Project", "Collaboration did not return Project model_name")
  end
end