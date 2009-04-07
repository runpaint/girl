class Girl
  VERSION = '0.0.1'
  attr_reader :pearls
  def initialize(*args)
    @pearls = args.flatten.compact
    raise ArgumentError unless @pearls.all?{|n| n.kind_of? String}
    @pearls.map!{|n| n.downcase.strip}.delete_if{|e| e == ''}.uniq!
    raise ArgumentError unless @pearls.size > 0
    raise ArgumentError unless @pearls.all?{|n| n.match(/^[a-zA-Z0-9_-]+$/)}
  end
  def pearl
    @pearls.first
  end  
  def show
    @pearls.each do |pearl|
      file = File.expand_path("~/.girl/pearls/#{pearl}.mdwn")
        raise NameError unless File.exists? file
        File.open(file, 'r') do |f|
          puts f.read
        end  
    end  
  end
end  
