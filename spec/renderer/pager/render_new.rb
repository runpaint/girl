require File.dirname(__FILE__) + '/../../spec_helper.rb'
require 'stringio'
describe 'Renderer::Pager.new' do
  it "requires a Pearl object as argument" do
    pearl = Pearl.new('dd')
    pearl.should be_kind_of(Pearl)
    lambda{renderer = Renderer::Pager.new( pearl )}.should_not 
      raise_error(ArgumentError)
    renderer.should be_kind_of(Renderer::Pager)  
  end  
  it "requires exactly one argument" do
    pearl = Pearl.new('cp')
    pearl2 = Pearl.new('mv')
    lambda{Renderer::Pager.new( pearl, pearl2 )}.should 
      raise_error(ArgumentError)
    lambda{Renderer::Pager.new( pearl, 'foo' )}.should 
      raise_error(ArgumentError)
  end  
end
