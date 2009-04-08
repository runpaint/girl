require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Girl.pearls" do
  it "returns an array of Pearls" do
    girl = Girl.new('ls')
    girl.pearls.should be_kind_of(Array)
    girl.pearls.all?{|p| p.should be_kind_of(Pearl)}

    girl = Girl.new('cat',['cpio'],'rmdir')
    girl.pearls.should be_kind_of(Array)
    girl.pearls.all?{|p| p.should be_kind_of(Pearl)}
  end
  it "returns the constructor's arguments" do
    girl = Girl.new('file','chmod',['mv','cp'])
    girl.pearls.map{|p| p.name}.should == %w{file chmod mv cp}  

    girl = Girl.new('cp')
    girl.pearls.first.name.should == 'cp'
  end
  it "returns the same number of arguments as passed to the constructor" do
    [ %w{mv}, %w{chmod rm file}, ['ls', 'cp', ['touch'] ]].each do |arg|
      Girl.new(arg).pearls.size.should == arg.flatten.size 
    end  
  end  
end  
