require 'spec_helper'
 
describe TaskOopGem do
  context "#name" do
    it "should return gem name" do
      TaskOopGem.name.should == "task_oop_gem"
    end
  end
end