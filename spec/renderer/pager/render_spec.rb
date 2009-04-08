require File.dirname(__FILE__) + '/../../spec_helper.rb'
require 'stringio'
describe 'Renderer::Pager.render' do
  it "displays pearls that can fit on the screen without a pager" do
    # To avoid having to depend on the terminal-size gem ourselves, we simply
    # assume that the terminal will be at least large enough to render 'false',
    # which is 4 lines long at the time of writing
    $stdout = StringIO.new
    @stdout_orig = $stdout
    p = Pearl.new('false')
    r = Renderer::Pager.new( p )
    r.render
    # As a rough heuristic, we assume that the output should be at least as
    # long as the source text minus 20. This metric is somewhat arbitrary, but
    # allows for the Formatter class to add some characters, for formatting
    # purposes, and strip some Markdown formatting...
    $stdout.string.size.should >= (p.text.size - 20)
    $stdout = @stdout_orig
  end  
  it "displays pearls longer than the screen with a pager"
end
