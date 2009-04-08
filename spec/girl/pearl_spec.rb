require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Girl.pearl" do
  it "returns a Pearl" do
    Girl.new('ls').pearl.should be_kind_of(Pearl)
    Girl.new('rm','cat').pearl.should be_kind_of(Pearl)
    Girl.new('cat','rm').pearl.should be_kind_of(Pearl)
    Girl.new(['ls']).pearl.should be_kind_of(Pearl)
    Girl.new('cat',['rm','rmdir']).pearl.should be_kind_of(Pearl)
  end
  it "returns a Pearl corresponding to the first argument to Girl.new" do
    Girl.new('ls').pearl.name.should == 'ls'
    Girl.new('cat','rm').pearl.name.should == 'cat'
    Girl.new(['rm','cat']).pearl.name.should == 'rm'
    Girl.new('cat',['rm','rmdir']).pearl.name.should == 'cat'
  end 
  it "returns the first element of .pearls" do
    [ %w{ls}, %w{cat rm}, ['cat', ['rm','rmdir']]].each do |arg|
      girl = Girl.new(arg.flatten)
      girl.pearl.should == girl.pearls.first
    end
  end  
end
