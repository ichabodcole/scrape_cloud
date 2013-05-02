require 'rubygems'
require 'mechanize'
require 'growl'

# includes the PAGE_URL var
require_relative 'url'

agent = Mechanize.new
page = agent.get(PAGE_URL)

cur_dir = File.expand_path File.dirname(__FILE__)
filename = cur_dir + "/page_links.txt"

# begin
note = Growl.new
note.message = ""

File.open(filename, 'w') do |f|
  page.links.each do |link|
    # link.click()
    if link.uri.host.nil?
      # link.click()
      f.puts((link.to_s + " : " + link.uri.to_s).strip)
    end
    note.message += link.uri.to_s + "\n"
    #text.gsub(/(\t)*/, '') + "\n"
  end
end
note.run if Growl.installed?
# rescue => e
#   Growl.notify{
#     self.message = e.to_s
#   }
# end
# agent.max_history = nil
# stack = agent.get(ARGV[0].links)

# puts stack