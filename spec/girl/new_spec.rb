require File.dirname(__FILE__) + '/../spec_helper.rb'

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
    Girl.new('rm', 'mkdir', ['ls']).
      pearls.map{|p| p.name}.should == ['rm','mkdir','ls']
    Girl.new('rm', 'mkdir', ['ls']).pearl.name.should == 'rm'
    lambda{Girl.new(['cpio','top'],'rm', 'mkdir', ['ls'])}.should_not raise_error
    Girl.new(['cpio','top'],'rm', 'mkdir', ['ls']).
      pearls.map{|p| p.name}.should == ['cpio','top','rm','mkdir','ls']
    Girl.new(['cpio','top'],'rm', 'mkdir', ['ls']).pearl.name.should == 'cpio'
  end  
  it "accepts only alphanumeric Strings, or Arrays thereof, as arguments" do
    [1, '~~', 'cat.dog', 29, ['foo', 9], '/dev/null'].each do |arg|
      lambda{Girl.new(arg)}.should raise_error(ArgumentError)
    end  
  end
  it "ignores duplicate arguments" do
    [ %w{cat cat}, ['tail',['cpio','tail']]].each do |arg|
      lambda{Girl.new(arg.flatten)}.should_not raise_error
      Girl.new(arg.flatten).pearls.map{|p| p.name}.should == 
        arg.flatten.uniq
    end
  end  
  it "ignores arguments that differ only in case" do
    [ %w{cat Cat}, ['tail',['cpio','TAIL']]].each do |arg|
      lambda{Girl.new(arg.flatten)}.should_not raise_error
      Girl.new(arg.flatten).pearls.map{|p| p.name}.should == 
        arg.flatten.map{|a|a.downcase}.uniq
    end
  end 
  it "normalises argument case" do
    [ %w{Tail tail grep}, ['GREP', ['ps','DD'], 'grep', 'grEp']].each do |arg|
      girl = Girl.new(arg.flatten)
      girl.pearls.map{|p| p.name}.should == 
        arg.flatten.map{|a| a.downcase}.uniq
    end
  end  
  it "normalises argument white space" do
    [ ['tail ', 'tail', 'grep '], [' ls ',' cat '],
      [[' ps','dd '], 'grep ']
    ].each do |arg|
      girl = Girl.new(arg.flatten)
      girl.pearls.map{|p| p.name}.should == 
        arg.flatten.map{|a| a.downcase.strip}.uniq
    end
  end  
  it "ignores empty strings" do
    lambda{Girl.new(['', 'cat'])}.should_not raise_error(ArgumentError)
    Girl.new(['','cat']).pearls.map{|p| p.name} == ['cat']
  end  
  it "ignores nils" do
    [ [nil,'ls'], ['cat',nil,['top','ps']]].each do |arg|
      lambda{Girl.new(arg.flatten)}.should_not raise_error
      Girl.new(arg.flatten).pearls.map{|p| p.name}.should == 
        arg.flatten.compact
    end  
  end  
end
