require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "cannot save without name" do
     project = Project.new 
     assert !project.save, "Saved the project without a name"
  end
   
  test "cannot save without description" do 
    project = Project.new 
    assert !project.save, "Saved the project without a description"
  end
  
  test "cannot save without access" do 
    project = Project.new
    assert !project.save, "Saved the project without access"
  end
  
  test "cannot save without type" do 
    project = Project.new
    assert !project.save, "Saved the project without type"
  end
  
  test "cannot save without a created_by user" do 
    project = Project.new 
    assert !project.save, "Saved the project without created_by"
  end
  
  test "model_name should return Project" do 
    assert_equal(Project.model_name, "Project", "Model parent name is not Project") 
  end

end
