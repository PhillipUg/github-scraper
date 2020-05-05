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

	# user_url = overview_page(username)

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

	def get_page(page, user_url)
		page_url = user_url + '?tab=' + page
		html = Nokogiri::HTML.parse(URI.open(page_url))

		case 
		when page == 'repositories' then get_repos(html)
		when page == 'stars' then get_stars(html)
		when page == 'followers' then get_followers(html)
		when page == 'following' then get_following(html)
		else
			raise 'Error!, category invalid'
		end
	end

	
	

	# p get_page(user_url, "repositories")

	# def lister(page_url)
		
	# end

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

def get_repos(html)
	repos = html.css('li.public')
	counter = 1
	repos.each do |repo|
	puts "#{counter}. " + repo.css('h3').text.gsub(/\n/, '').gsub(' ', '')
	counter += 1
	end
end

def get_stars(html)
	stars = html.css('div.d-block')
	counter = 1
	stars.each do |star|
	puts "#{counter}. " + star.css('h3').text.gsub(/\n/, '').gsub(' ', '')
	counter += 1
	end
end

def get_followers(html)
	followers = html.css('div.table-fixed')
	counter = 1
	followers.each do |follower|
	puts "#{counter}. " + follower.css('span.f4').text
	counter += 1
	end
end

def get_following(html)
	following = html.css('div.table-fixed')
	counter = 1
	following.each do |user|
	puts "#{counter}. " + user.css('span.f4').text
	counter += 1
	end
end







