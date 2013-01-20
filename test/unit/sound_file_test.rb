require 'test_helper'

class SoundFileTest < ActiveSupport::TestCase
  test "should not save without file" do
     sound = SoundFile.new 
     assert !sound.save, "Saved the soundfile without a file"
  end
  
  test "should not save without name" do
     sound = SoundFile.new 
     assert !sound.save, "Saved the soundfile without a name"
  end
  
end
