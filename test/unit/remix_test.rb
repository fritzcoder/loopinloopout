require 'test_helper'

class RemixTest < ActiveSupport::TestCase
  test "model_name should return Project" do
      assert_equal(Remix.model_name, "Project", "Remix did not return Project model_name")
  end
end
