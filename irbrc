require 'rubygems'
require 'irb/completion'
begin
  require 'irb/ext/save-history'
rescue LoadError
  puts "irb/ext/save-history is MRI only"
end

# Pretty Print method
require 'pp'

# Remove the annoying irb(main):001:0 and replace with >>
IRB.conf[:PROMPT_MODE] = :SIMPLE

# Load the readline module.
IRB.conf[:USE_READLINE] = true

# Automatic Indentation
IRB.conf[:AUTO_INDENT]=true

# Save History between irb sessions
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb.hist"

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def paste
  `pbpaste`
end

load File.dirname(__FILE__) + '/.railsrc' if ($0 == 'irb' && ENV['RAILS_ENV']) || ($0 == 'script/rails' && Rails.env)


