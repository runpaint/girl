class Girl
  VERSION = '0.0.1'
  attr_reader :nuggets
  def initialize(*args)
    @nuggets = args.flatten.compact
    raise ArgumentError unless @nuggets.all?{|n| n.kind_of? String}
    @nuggets.map!{|n| n.downcase.strip}.delete_if{|e| e == ''}.uniq!
    raise ArgumentError unless @nuggets.size > 0
    raise ArgumentError, @nuggets.inspect unless @nuggets.all?{|n| n.match(/^[a-zA-Z0-9_-]+$/)}
  end
  def nugget
    @nuggets.first
  end  
end  
