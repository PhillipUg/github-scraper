#!/usr/bin/env ruby

require_relative '../lib/scrapper.rb'

puts "Welcome!. This is a github scraping tool."
puts ""
puts "All you have to do is input any github username and it shall do the rest."

# arr1 = ['bob', 'bobby', 'love to code', 'full stack dev', 'remote', 'www.bobtec.com']
Scraper.display_output

puts ""




puts "Enter github username: "

Scraper.run(gets.chomp)

puts ''


