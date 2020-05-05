#!/usr/bin/env ruby

require_relative '../lib/scrapper.rb'

def display_output(array)

	puts ""
	puts "-------------------------------"
	puts ""
	puts "Name: #{array[0]} (#{array[1]})"
	puts ""
	puts "Bio: #{array[2]}"
	puts ""
	puts "Work: #{array[3]}"
	puts ""
	puts "Location: #{array[4]}"
	puts ""
	puts "Website: #{array[5]}"
	puts ""
	puts "---------------------------------"
	puts ""
end


def display_prompt(summary_info, scraper)
	puts "----------------------------"
	puts ""
	puts "repositories: #{summary_info[7]}"
	puts "stars: #{summary_info[9]}"
	puts "followers: #{summary_info[10]}"
	puts "following: #{summary_info[11]}"
	puts ""
	puts "Enter a category name to get a list of its contents e.g. enter 'repositories' or 'stars'"
	puts ""
	list = scraper.get_page(gets.chomp)
	list.each {|item| puts item}
end

puts ""
puts "Welcome!. This is a github scraping tool."
puts ""
puts "All you have to do is input any github username and it shall do the rest."

display_output(array = Array.new(12, 'xxxxx'))

puts ""

puts "Enter any Github username: "

scraper = Scraper.new(gets.chomp)
puts "Invalid Github username" unless scraper.valid
exit unless scraper.valid


summary_info = scraper.get_profile_info
display_output(summary_info) 


loop do 
	display_prompt(summary_info, scraper)
end





	
