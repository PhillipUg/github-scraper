require_relative 'user.rb'

require "nokogiri"
require "open-uri"

class Scraper
	attr_reader :valid

	URL = "https://github.com/"

	def initialize(username)
		@user = User.new
		@user.name = username
		@user_url = URL + username
		
		@valid = true
		begin
     		profile_page = Nokogiri::HTML.parse(URI.open(@user_url))
    	rescue StandardError
      		@valid = false
      		return
    	end
		
		get_name(profile_page)
		get_nickname(profile_page)
		get_work(profile_page)
		get_bio(profile_page)
		get_location(profile_page)
		get_website(profile_page)
		get_pinned_repos(profile_page)
		get_counters(profile_page)
	end

	def get_name(profile_page)
		name = profile_page.css('span.p-name')
		name ? @user.name = name.text : @user.name = "![ field blank ]"
	end

	def get_nickname(profile_page)
		nickname = profile_page.css('span.p-nickname')
		nickname ? @user.nickname = nickname.text : @user.nickname = '![ field blank ]'
	end

	def get_work(profile_page)
		work = profile_page.css('span.p-org')[0]
		work ? @user.work = work.text : @user.work = '![ field blank ]'
	end

	def get_location(profile_page)
		location = profile_page.css('span.p-label')[0]
		location ? @user.location = location.text : @user.location = "![ field blank ]"
	end

	def get_website(profile_page)
		website = profile_page.css('li.vcard-detail a')[1]
		website ? @user.website = website.text : @user.website = "![ field blank ]"
	end

	def get_bio(profile_page)
		bio = profile_page.css('div.user-profile-bio')[0]
		bio ? @user.bio = bio.text.gsub(/\n/, '') : @user.bio = "![ field blank ]"
	end

	def get_pinned_repos(profile_page)
		pinned_repos = profile_page.css('.pinned-item-list-item')
		pinned = []
		pinned_repos.each do |item|
			pinned << item.css('span.repo').text
		end
		@user.pinned = pinned
	end

	def get_profile_info
		user_summary = []
		[
			@user.name,
			@user.nickname,
			@user.bio,
			@user.work,
			@user.location,
			@user.website
		].each {|item| user_summary << item}
		
		@user.summary.each {|item| user_summary << item}
		
		user_summary
	end

	def get_counters(profile_page)
		nav = profile_page.css('.UnderlineNav-item')
		nav.each do |item|
			@user.summary << item.css('.Counter').text.gsub(/\n/, '').gsub(' ', '').to_i
		end
	end

	def get_page(page)
		page_url = @user_url + '?tab=' + page
		html = Nokogiri::HTML.parse(URI.open(page_url))

		case 
		when page == 'repositories' then get_repos(html)
		when page == 'stars' then get_stars(html)
		when page == 'followers' then get_followers(html)
		when page == 'following' then get_following(html)
		else
			return ['Error!, category invalid']
		end
	end

	def get_repos(html)
		repos = html.css('li.public')
		counter = 1
		repoz = []
		repos.each do |repo|
		repoz << ("#{counter}. " + repo.css('h3').text.gsub(/\n/, '').gsub(' ', ''))
		counter += 1
		end
		repoz
	end

def get_stars(html)
	stars = html.css('div.d-block')
	counter = 1
	starz = []
	stars.each do |star|
	starz << ("#{counter}. " + star.css('h3').text.gsub(/\n/, '').gsub(' ', ''))
	counter += 1
	end
	starz
end

def get_followers(html)
	followers = html.css('div.table-fixed')
	counter = 1
	followerz = []
	followers.each do |follower|
	followerz << ("#{counter}. " + follower.css('span.f4').text)
	counter += 1
	end
	followerz
end

def get_following(html)
	following = html.css('div.table-fixed')
	counter = 1
	followingz = []
	following.each do |user|
	followingz << ("#{counter}. " + user.css('span.f4').text)
	counter += 1
	end
	followingz
end


end
