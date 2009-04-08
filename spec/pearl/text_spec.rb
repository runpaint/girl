require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Pearl.text" do
  
  it "accepts no arguments" do
    lambda{Pearl.new('ls').text}.should_not raise_error
    lambda{Pearl.new('dd').text('glark')}.should raise_error(ArgumentError)
  end
  it "returns a String when the Pearl exists" do
    p = Pearl.new('ls')
    p.exists?.should == true
    p.text.should be_kind_of(String)
  end
  it "returns nil when the Pearl doesn't exist" do
    p = Pearl.new('xxcf')
    p.exists?.should == false
    p.text.should == nil
  end
  it "returns the source text of the Pearl" do
    p = Pearl.new('rm')
    p.text.should match(/rm -rf/)
    p.text.should_not match(/<\w+>/)
  end  
end
