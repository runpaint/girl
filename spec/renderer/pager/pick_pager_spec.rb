require File.dirname(__FILE__) + '/../../spec_helper.rb'
require 'ftools'
describe 'Renderer::Pager.pick_pager.' do
  # We assume that everybody has at least one pager installed on their system.
  it "returns a full path" do
    pearl = Pearl.new('ls')
    renderer = Renderer::Pager.new( pearl )
    pager = renderer.pick_pager
    File.expand_path(pager).should == pager
    File.identical?(File.expand_path(pager), pager).should == true
  end  
  it "uses the value of PAGER if defined" do
    ENV['PAGER'] = 'less'
    pearl = Pearl.new('ls')
    renderer = Renderer::Pager.new( pearl )
    renderer.pick_pager.should match(/less$/)
  end  
  it "uses another installed pager if PAGER is unset" do
    ENV['PAGER'] = nil
    pearl = Pearl.new('ls')
    renderer = Renderer::Pager.new( pearl )
    renderer.pick_pager.should match(/less|more|most/)
  end  
  it "uses a pager which is installed on the system" do
    ENV['PAGER'] = nil
    pearl = Pearl.new('ls')
    renderer = Renderer::Pager.new( pearl )
    pager = renderer.pick_pager
    File.executable?(pager).should == true
  end  
end
