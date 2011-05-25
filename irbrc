require 'rubygems'
require 'irb/completion'
begin
  require 'irb/ext/save-history'
rescue LoadError
  puts "irb/ext/save-history is MRI only"
end

# For vim integration
begin
  require 'interactive_editor'
rescue LoadError
  puts "interactive_editor is not installed. To enable, run: gem install interactive_editor"
end

# Pretty Print method
require 'pp'

# Awesome Print gem (gem install awesome_print)
begin
  #require 'ap'
rescue LoadError
  puts "ap is not installed. To enable, run: gem install awesome_print"
end

# Print information about any HTTP requests being made
begin
  #require 'net-http-spy'
rescue LoadError
  puts "net-http-spy is not installed. To enable, run: gem install net-http-spy"
end

# Wirble is a set of enhancements for irb
# http://pablotron.org/software/wirble/README
# Implies require 'pp', 'irb/completion', and 'rubygems'
begin
  require 'wirble'
  Wirble.init

  # Enable colored output
  Wirble.colorize
rescue LoadError
  puts "wirble is not installed. To enable, run: gem install wirble"
end

begin
  # Add Object#ls to display methods
  require 'looksee'
rescue LoadError
  puts "looksee is not installed. To enable, run: gem install looksee"
end

# Remove the annoying irb(main):001:0 and replace with >>
IRB.conf[:PROMPT_MODE] = :SIMPLE

# Load the readline module.
IRB.conf[:USE_READLINE] = true

# Automatic Indentation
IRB.conf[:AUTO_INDENT]=true

# Save History between irb sessions
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb.hist"

# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

class Object
  # print documentation
  #
  # ri 'Array#pop'
  # Array.ri
  # Array.ri :pop
  # arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end
end

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def paste
  `pbpaste`
end

load File.dirname(__FILE__) + '/.railsrc' if ($0 == 'irb' && ENV['RAILS_ENV']) || ($0 == 'script/rails' && Rails.env)

def b_to_s(b)
  n = b.size % 8
  n == 0 ? b : '0' * (8 -n) + b
end

def h_to_s(h)
  n = h.size % 2
  n == 0 ? h : '0' * (2 -n) + h
end

def i2b(int)
  b_to_s(int.to_s(2))
end

def h2b(h)
  i2b(h2i(h))
end

def b2i(b)
  b.to_i(2)
end

def i2h(i)
  h_to_s(i.to_s(16).upcase)
end

def b2h(b)
  i2h(b2i(b))
end

def h2i(h)
  h.to_i(16)
end
