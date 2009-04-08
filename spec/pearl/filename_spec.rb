require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Pearl.filename" do
  
  it "accepts no arguments" do
    lambda{Pearl.new('ls').filename}.should_not raise_error
    lambda{Pearl.new('cpio').filename(2)}.should raise_error(ArgumentError)
  end
  it "returns a String" do
    p = Pearl.new('ls')
    p.filename.should be_kind_of(String)
  end
end
