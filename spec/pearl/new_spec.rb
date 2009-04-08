require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Pearl.new" do
  
  it "requires an argument" do
    lambda{Pearl.new('ls')}.should_not raise_error
    lambda{Pearl.new}.should raise_error(ArgumentError)
    lambda{Pearl.new(nil)}.should raise_error(ArgumentError)
    lambda{Pearl.new([])}.should raise_error(ArgumentError)
  end
  it "requires exactly one argument" do
    lambda{Pearl.new('ls','cat')}.should raise_error(ArgumentError)
    lambda{Pearl.new('ls','cat','mv')}.should raise_error(ArgumentError)
  end
  it "requires an argument at least two characters long" do
    lambda{Pearl.new(' ')}.should raise_error(ArgumentError)
    lambda{Pearl.new('m')}.should raise_error(ArgumentError)
    lambda{Pearl.new('mv')}.should_not raise_error(ArgumentError)
  end  
  it "requires a String as an argument" do
    [ [1, 2], nil, [{'foo' => 'bar'}], [Proc.new{}, 
      File.new('/tmp')], 5.8 ].each do |arg|
      arg.flatten! if arg.respond_to?(:flatten)
      lambda{Pearl.new(arg)}.should raise_error(ArgumentError)
    end  
  end
  it "requires an alphanumeric argument" do
    [ '3,3', '!abcd', 'a_d' ].each do |arg|
      lambda{Pearl.new(arg)}.should raise_error(ArgumentError)
    end  
  end  
  it "instantiates a Pearl object" do
    Pearl.new('ls').should be_kind_of(Pearl)
    Pearl.new('ls').should be_instance_of(Pearl)
    Pearl.new('cpio').should be_kind_of(Pearl)
    Pearl.new('cpio').should be_instance_of(Pearl)
  end
end
