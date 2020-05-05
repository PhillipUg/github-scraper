require 'nokogiri'
require 'open-uri'



# pages = ["repositories", "stars", "followers", "following"]

# module UrlParser
	# username = 'phillipug'
	# page_urls = []

	def overview_page(username)
		url = "https://github.com/"
		url + username 
	end


	def get_profile_info(user_url)
		user_summary = []
		profile_page = Nokogiri::HTML.parse(URI.open(user_url))

		[profile_page.css('span.p-name').text,
		profile_page.css('span.p-nickname').text,
		profile_page.css('div.user-profile-bio')[0].text.gsub(/\n/, ''),
		profile_page.css('span.p-org')[0].text,
		profile_page.css('span.p-label')[0].text,
		profile_page.css('li.vcard-detail a')[1].text].each {|item| user_summary << item}

		nav = profile_page.css('.UnderlineNav-item')
		nav.each do |item|
			user_summary << item.css('.Counter').text.gsub(/\n/, '').gsub(' ', '').to_i
		end
		user_summary
	end

	# user_url = overview_page(username)

	# pages.each do |page|
	# 	page_urls << (user_url + '?tab=' + page)
	# end
	

	# page_urls


# profile_page = Nokogiri::HTML.parse(URI.open(user_url))
# repos_page = Nokogiri::HTML.parse(URI.open(page_urls[0]))
# stars_page = Nokogiri::HTML.parse(URI.open(page_urls[3]))
# followers_page = Nokogiri::HTML.parse(URI.open(page_urls[4]))
# following_page = Nokogiri::HTML.parse(URI.open(page_urls[5]))



# pinned_repos = profile_page.css('.pinned-item-list-item')
# pinned_repos.each do |item|
# 	p item.css('span.repo').text
# end

# repos = repos_page.css('li.public')
# repos.each do |repo|
# 	p repo.css('h3').text.gsub(/\n/, '').gsub(' ', '')
# end

# stars = stars_page.css('div.d-block')
# stars.each do |star|
# 	p star.css('h3').text.gsub(/\n/, '').gsub(' ', '')
# end

# followers = followers_page.css('div.table-fixed')
# followers.each do |follower|
# 	p follower.css('span.f4').text
# end

# following = following_page.css('div.table-fixed')
# following.each do |user|
# 	p user.css('span.f4').text
# end







