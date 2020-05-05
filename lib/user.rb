

require "nokogiri"
require "open-uri"

class User
	# attr_reader :get_name, :get_nickname, :get_work, :get_location, :get_bio, :get_website, :get_pinned_repos
	URL = "https://github.com/"

	def initialize(username)
		@username = username
		@user_url = URL + @username
		@profile_page = Nokogiri::HTML.parse(URI.open(@user_url))
	end

	def get_name
		name = @profile_page.css('span.p-name')
		name ? name.text : "![ field blank ]"
	end

	def get_nickname
		nickname = @profile_page.css('span.p-nickname')
		nickname ? nickname.text : '![ field blank ]'
	end

	def get_work
		work = @profile_page.css('span.p-org')[0]
		work ? work.text : '![ field blank ]'
	end

	def get_location
		location = @profile_page.css('span.p-label')[0]
		location ? location.text : "![ field blank ]"
	end

	def get_website
		website = @profile_page.css('li.vcard-detail a')[1]
		website ? website.text : "![ field blank ]"
	end

	def get_bio
		bio = @profile_page.css('div.user-profile-bio')[0]
		bio ? bio.text.gsub(/\n/, '') : "![ field blank ]"
	end

	def get_pinned_repos
		pinned_repos = @profile_page.css('.pinned-item-list-item')
		pinned = []
		pinned_repos.each do |item|
			pinned << item.css('span.repo').text
		end
		pinned
	end

	# def get_repos

	# end

	# def get_stars

	# end

	# def get_followers

	# end

	# def get_following

	# end
end


# def find_indexes_for(html, identifier)
# 	found_indexes = []
# 	current_index = 0
# 	while current_index != nil
# 		current_index = html[(current_index + 1)..-1].index(identifier)
# 		if current_index != nil
# 			current_index += 1
# 			if found_indexes.any?
# 				current_index = found_indexes.last + current_index
# 			end
# 			found_indexes << current_index
# 		end
# 	end
# 	found_indexes
# end



user1 = User.new('dennisosido')

p user1.get_name
p user1.get_nickname
p user1.get_bio
p user1.get_work
p user1.get_location
p user1.get_website
p user1.get_pinned_repos