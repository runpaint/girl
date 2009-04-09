class File
  def self.whereis(command)
    ENV['PATH'].split(/:/).each do |path|
      path << "/#{command}"
      return path if File.exists? path
    end
    nil
  end
end
module GirlDoc
  class PearlNotFound < StandardError
  end  
  VERSION = '0.0.1'
  class Girl
    attr_reader :pearls, :formatted
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
        next unless pearl.exists?
        r = Renderer::Pager.new(pearl)
        r.render
      end  
    end
  end
  class Pearl
    attr_reader :name
    attr_accessor :formatted
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
  class Formatter
    class ANSI
      require 'rubygems'
      require 'text/highlight'
      def initialize(pearl)
        @pearl = pearl
      end
      def format
        raw = @pearl.text
        hl = Text::ANSIHighlighter.new
        String.highlighter = hl
        raw.gsub!(/(`([^`]+)`)/) do |m| 
          m[1..-2].bold
        end
        raw.gsub!(/_([^\_ ]+)_/) {|m| m[1..-2].magenta}
        raw.gsub!(/\*([^\* ]+)\*/) {|m| m[1..-2].bold}
        raw.gsub!(/^#+ (.+)/) do |h| 
          h.sub(/^#+\s+/,'').upcase.bold
        end
        raw
      end
    end  
    class PlainText
      def initialize(pearl)
        @pearl = pearl
      end
      def format
        @pearl.text
      end  
    end  
  end
  class Renderer
    def initialize( pearl )
      @pearl = pearl
      raise PearlNotFound unless @pearl.exists?
    end  
  end    
  class Renderer::Pager < Renderer 
    PAGERS = %w{pager most more less}
    @use_stdout = true
    
    def initialize( pearl )
      super pearl
    end
    def render
      require 'rubygems'
      require 'terminal/size'
      require 'pathname'
      @use_stdout = false
      terminal = TerminalSize.new
      @page = @pearl.text.split("\n").size < terminal.rows ? false : true
      page do 
        fclass = self.pager_name == 'less' ? 'PlainText' : 'ANSI'
        formatter = Formatter.const_get(fclass).new( @pearl )
        puts formatter.format
      end  
    end
    # Note: The following two methods were derived from code in the
    # rdoc/ri/ri_display.rb file distributed as part of Ruby 1.8. This code is
    # licensed under the GPL, as is this library. 
    def setup_pager
      unless @use_stdout
        # FIXME: If ENV['PAGER'] is set to some unusable value, e.g. whitespace,
        # we crash when trying to write to the pipe. Find out why IO.popen allows this.
        pagers =  [ENV['PAGER']] + PAGERS 
        for pager in pagers.compact.uniq
          @pager_name = pager
          return IO.popen(pager, "w") rescue nil
        end
        @use_stdout = true
        @pager_name = nil
        nil
      end
    end
    def page
      return yield unless @page && pager = setup_pager
      begin
        save_stdout = STDOUT.clone
        STDOUT.reopen(pager)
        yield
      ensure
        STDOUT.reopen(save_stdout)
        save_stdout.close
        pager.close
      end
    end 
    #def pick_pager
    #  pagers =  [ENV['PAGER']] + PAGERS 
    #  for pager in pagers.compact.uniq
    #    @pager_name = pager
    #    return @pager = IO.popen(pager, "w") rescue nil
    #  end
    #  @pager_name = nil
    #  nil
    #end  
    def pager_name
      File.basename(Pathname.new(File.whereis @pager_name).realpath)
    end  
  end  
end

    
