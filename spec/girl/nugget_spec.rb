require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Girl.nugget" do
  it "returns a String" do
    Girl.new('ls').nugget.should be_kind_of(String)
    Girl.new('rm','cat').nugget.should be_kind_of(String)
    Girl.new('cat','rm').nugget.should be_kind_of(String)
    Girl.new(['ls']).nugget.should be_kind_of(String)
    Girl.new('cat',['rm','rmdir']).nugget.should be_kind_of(String)
  end
  it "returns the first argument to Girl.new" do
    Girl.new('ls').nugget.should == 'ls'
    Girl.new('cat','rm').nugget.should == 'cat'
    Girl.new(['rm','cat']).nugget.should == 'rm'
    Girl.new('cat',['rm','rmdir']).nugget.should == 'cat'
  end 
  it "returns the first element of .nuggets" do
    [ %w{ls}, %w{cat rm}, ['cat', ['rm','rmdir']]].each do |arg|
      girl = Girl.new(arg.flatten)
      girl.nugget.should == girl.nuggets.first
    end
  end  
end
