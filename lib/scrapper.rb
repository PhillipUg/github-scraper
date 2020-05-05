require_relative 'urlparser.rb'

class Scraper
	def self.run(username)
		user_url = overview_page(username)
		summary_info = get_profile_info(user_url)
		display_output(summary_info)
	end

	def self.display_output(array = Array.new(12, 'xxxxx'))
		# array = Array.new(9, 'xxxxx')

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
		puts "Repos: #{array[7]}"
		puts "Stars: #{array[9]}"
		puts "Followers: #{array[10]}"
		puts "Following: #{array[11]}"
		puts ""
	end

end
