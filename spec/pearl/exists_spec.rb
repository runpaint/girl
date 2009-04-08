require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Pearl.exists?" do
  
  it "accepts no arguments" do
    lambda{Pearl.new('ls').exists?}.should_not raise_error
    lambda{Pearl.new('cpio').exists?('foo')}.should raise_error(ArgumentError)
  end
  it "returns a  boolean" do
    p = Pearl.new('ls')
    p.exists?.should be_kind_of(TrueClass)
    p = Pearl.new('zzzk2')
    p.exists?.should be_kind_of(FalseClass)
  end
end
