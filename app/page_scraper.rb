# encoding: utf-8
require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'pp'

# includes the PAGE_URL var
require_relative 'url'

cur_dir = File.expand_path File.dirname(__FILE__)
dest = cur_dir + "/js/scrape_data.js"

def freq(words, char_min=0)
  words.select{|word| word.length > 3}.group_by(&:downcase).map{ |word, instances|
    Hash[:text, word, :size, instances.length]
  }.sort_by{|obj| obj[:size]}.reverse
end

def run(url, dest)
  html = Nokogiri::HTML(open(url))
  html.css('script').remove
  words = html.at_css('body').inner_text.scan(/\w+/)
  word_hash = freq(words)
  data_str = 'var scrapeData = ' + JSON.generate(word_hash).to_s + ";"
  filename = dest
  File.open(filename, 'w') do |f|
     f.puts data_str
  end
end

run(PAGE_URL, dest)