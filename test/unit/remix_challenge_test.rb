require 'test_helper'

class RemixChallengeTest < ActiveSupport::TestCase
  test "model_name should return Project" do
      assert_equal(RemixChallenge.model_name, "Project", "Remix did not return Project model_name")
  end
end
