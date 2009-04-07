require File.dirname(__FILE__) + '/../spec_helper.rb'
require 'stringio'
describe "Girl.show" do
  before(:each) do
    @girl = Girl.new('cat')
  end  
  it "should raise an ArgumentError if called with arguments" do
    lambda{@girl.show(1)}.should raise_error(ArgumentError)
  end
  it "should print the pearls to STDOUT" do
    @stdout_orig = $stdout
    $stdout = StringIO.new 
    [ %w{ls}, %w{rm cat} ].each do |args|
      girl = Girl.new(args.flatten)
      girl.show
      girl.pearls.each do |pearl|
        $stdout.string.should match(/#{pearl}/)
      end
      $stdout.string.length > 100
      end    
    $stdout = @stdout_orig
  end 
  it "should raise a NameError if the pearl doesn't exist" do
    girl = Girl.new('xxxz')
    lambda{girl.show}.should raise_error(NameError)
  end  
end
