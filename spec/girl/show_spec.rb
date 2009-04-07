require File.dirname(__FILE__) + '/../spec_helper.rb'
require 'stringio'
describe "Girl.show" do
  before(:each) do
    @girl = Girl.new('cat')
  end  
  it "should raise an ArgumentError if called with arguments" do
    lambda{@girl.show(1)}.should raise_error(ArgumentError)
  end
  it "should print the nuggets to STDOUT" do
    @stdout_orig = $stdout
    $stdout = StringIO.new 
    @girl.show
    @girl.nuggets.each do |nugget|
      $stdout.string.should match(/#{nugget}/)
    end
    $stdout.string.length > 100    
    $stdout = @stdout_orig
  end 
  it "should raise a NameError if the nugget doesn't exist" do
    girl = Girl.new('xxxz')
    lambda{girl.show}.should raise_error(NameError)
  end  
end
