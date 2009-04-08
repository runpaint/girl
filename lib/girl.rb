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
        puts pearl.text if pearl.exists?
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
      raise ArgumentError unless @name.match(/^[a-z0-9]{2,}$/)
    end
    def exists?
      File.exists? self.filename
    end  
    def filename
      @filename ||= File.expand_path("~/.girl/pearls/#{self.name}.mdwn")
    end
    def text
      return nil unless self.exists?
      File.open(self.filename, 'r') {|f| return f.read}
    end  
  end  
end  

