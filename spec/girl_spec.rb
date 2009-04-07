require File.dirname(__FILE__) + '/spec_helper.rb'
__END__
describe "Girl.new" do
  
  it "requires an argument" do
    lambda{Girl.new('ls')}.should_not raise_error
    Girl.new('ls').should be_kind_of(Girl)
    Girl.new('ls').should be_instance_of(Girl)
    lambda{Girl.new}.should raise_error(ArgumentError)
    lambda{Girl.new(nil)}.should raise_error(ArgumentError)
    lambda{Girl.new([])}.should raise_error(ArgumentError)
  end
  it "accepts an array containing an argument" do
    lambda{Girl.new(['mkdir'])}.should_not raise_error
  end  
  it "accepts multiple arguments" do
    lambda{Girl.new('ls','cat')}.should_not raise_error
    Girl.new('ls','cat').should be_kind_of(Girl)
    Girl.new('ls','cat').should be_instance_of(Girl)
  end
  it "accepts an array containing multiple arguments" do
    lambda{Girl.new(['cpio','mkdir'])}.should_not raise_error
  end
  it "only accepts Strings or Arrays of Strings as arguments" do
    [ [1, 2], [{'foo' => 'bar'}], [Proc.new{}, File.new('/tmp')], 5.8 ].each do |arg|
      lambda{Girl.new(arg)}.should raise_error(ArgumentError)
    end  
  end
  it "accepts a combination of Arrays of Strings and Strings as arguments" do
    lambda{Girl.new('rm', 'mkdir', ['ls'])}.should_not raise_error
    Girl.new('rm', 'mkdir', ['ls']).nuggets.should == ['rm','mkdir','ls']
    Girl.new('rm', 'mkdir', ['ls']).nugget.should == 'rm'
    lambda{Girl.new(['cpio','top'],'rm', 'mkdir', ['ls'])}.should_not raise_error
    Girl.new(['cpio','top'],'rm', 'mkdir', ['ls']).nuggets.should == 
      ['cpio','top','rm','mkdir','ls']
    Girl.new(['cpio','top'],'rm', 'mkdir', ['ls']).nugget.should == 'cpio'
  end  
  it "accepts only alphanumeric Strings, or Arrays thereof, as arguments" do
    [1, '~~', 'cat.dog', 29, ['foo', 9], '/dev/null'].each do |arg|
      lambda{Girl.new(arg)}.should raise_error(ArgumentError)
    end  
  end
  it "ignores duplicate arguments" do
    [ %w{cat cat}, ['tail',['cpio','tail']]].each do |arg|
      lambda{Girl.new(arg.flatten)}.should_not raise_error
      Girl.new(arg.flatten).nuggets.should == arg.flatten.uniq
    end
  end  
  it "ignores arguments that differ only in case" do
    [ %w{cat Cat}, ['tail',['cpio','TAIL']]].each do |arg|
      lambda{Girl.new(arg.flatten)}.should_not raise_error
      Girl.new(arg.flatten).nuggets.should == 
        arg.flatten.map{|a|a.downcase}.uniq
    end
  end 
  it "normalises argument case" do
    [ %w{Tail tail grep}, ['GREP', ['ps','DD'], 'grep', 'grEp']].each do |arg|
      girl = Girl.new(arg.flatten)
      girl.nuggets.should == arg.flatten.map{|a| a.downcase}.uniq
    end
  end  
  it "normalises argument white space" do
    [ ['tail ', 'tail', 'grep '], [' ls ',' cat '],
      [[' ps','dd '], 'grep ']
    ].each do |arg|
      girl = Girl.new(arg.flatten)
      girl.nuggets.should == arg.flatten.map{|a| a.downcase.strip}.uniq
    end
  end  
  it "ignores empty strings" do
    lambda{Girl.new(['', 'cat'])}.should_not raise_error(ArgumentError)
    Girl.new(['','cat']).nuggets == ['cat']
  end  
  it "ignores nils" do
    [ [nil,'ls'], ['cat',nil,['top','ps']]].each do |arg|
      lambda{Girl.new(arg.flatten)}.should_not raise_error
      Girl.new(arg.flatten).nuggets.should == arg.flatten.compact
    end  
  end  
end
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
