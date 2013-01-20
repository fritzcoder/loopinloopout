require 'test_helper'

class ChallengeTest < ActiveSupport::TestCase
  test "model_name should return Project" do
      assert_equal(Challenge.model_name, "Project", "Challenge did not return Project model_name")
  end
end