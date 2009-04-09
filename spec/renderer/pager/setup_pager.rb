#!/usr/bin/ruby
require 'lib/girl'
include GirlDoc
#Girl.new(ARGV).show
p = Pearl.new('ls')
r = Renderer::Pager.new( p )
r = 
