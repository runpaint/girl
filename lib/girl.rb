module GirlDoc
  VERSION = '0.0.1'
  class Girl
    attr_reader :pearls
    def initialize(*args)
      @pearls = args.flatten.compact.delete_if{|a| a =~ /^\s*$/}
      @pearls.map!{|a| Pearl.new(a)}.uniq!
      raise ArgumentError unless @pearls.size > 0
    end
    def pearl
      @pearls.first
    end  
    def show
      @pearls.each do |pearl|
        file = File.expand_path("~/.girl/pearls/#{pearl.name}.mdwn")
          raise NameError unless File.exists? file
          File.open(file, 'r') do |f|
            puts f.read
          end  
      end  
    end
  end
  class Pearl
    attr_reader :name
    def hash
      self.name.hash
    end  
    def eql?(obj)
      raise ArgumentError unless obj.kind_of?(Pearl)
      self.name.eql?(obj.name)
    end  
    def initialize(name)
      raise ArgumentError unless name.kind_of? String
      @name = name.downcase.strip
      raise ArgumentError unless @name.match(/^[a-zA-Z0-9_-]{2,}$/)
    end  
  end  
end  

