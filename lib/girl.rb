class Girl
  VERSION = '0.0.1'
  attr_reader :nuggets
  def initialize(*args)
    @nuggets = args.flatten.compact
    raise ArgumentError unless @nuggets.all?{|n| n.kind_of? String}
    @nuggets.map!{|n| n.downcase.strip}.delete_if{|e| e == ''}.uniq!
    raise ArgumentError unless @nuggets.size > 0
    raise ArgumentError unless @nuggets.all?{|n| n.match(/^[a-zA-Z0-9_-]+$/)}
  end
  def nugget
    @nuggets.first
  end  
  def show
    @nuggets.each do |nugget|
      file = File.expand_path("~/.girl/data/#{nugget}.mdwn")
        raise NameError unless File.exists? file
        File.open(file, 'r') do |f|
          puts f.read
        end  
    end  
  end
end  
