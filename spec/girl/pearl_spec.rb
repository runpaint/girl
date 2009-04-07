require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Girl.pearl" do
  it "returns a String" do
    Girl.new('ls').pearl.should be_kind_of(String)
    Girl.new('rm','cat').pearl.should be_kind_of(String)
    Girl.new('cat','rm').pearl.should be_kind_of(String)
    Girl.new(['ls']).pearl.should be_kind_of(String)
    Girl.new('cat',['rm','rmdir']).pearl.should be_kind_of(String)
  end
  it "returns the first argument to Girl.new" do
    Girl.new('ls').pearl.should == 'ls'
    Girl.new('cat','rm').pearl.should == 'cat'
    Girl.new(['rm','cat']).pearl.should == 'rm'
    Girl.new('cat',['rm','rmdir']).pearl.should == 'cat'
  end 
  it "returns the first element of .pearls" do
    [ %w{ls}, %w{cat rm}, ['cat', ['rm','rmdir']]].each do |arg|
      girl = Girl.new(arg.flatten)
      girl.pearl.should == girl.pearls.first
    end
  end  
end
