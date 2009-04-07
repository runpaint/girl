require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Girl.nuggets" do
  it "returns an array of Strings" do
    girl = Girl.new('ls')
    girl.nuggets.should be_kind_of(Array)
    girl.nuggets.all?{|n| n.should be_kind_of(String)}

    girl = Girl.new('cat',['cpio'],'rmdir')
    girl.nuggets.should be_kind_of(Array)
    girl.nuggets.all?{|n| n.should be_kind_of(String)}
  end
  it "returns the constructor's arguments" do
    girl = Girl.new('file','chmod',['mv','cp'])
    girl.nuggets.should == %w{file chmod mv cp}  

    girl = Girl.new('cp')
    girl.nuggets.should == %w{cp}
  end
  it "returns the same number of arguments as passed to the constructor" do
    [ %w{mv}, %w{chmod rm file}, ['ls', 'cp', ['touch'] ]].each do |arg|
      Girl.new(arg).nuggets.size.should == arg.flatten.size 
    end  
  end  
end  
