require_relative 'user.rb'

require "nokogiri"
require "open-uri"

class Scraper
	attr_reader :valid, :username

	URL = "https://github.com/"

	def initialize(username)
		@username = username
		@user = User.new
		@user_url = URL + @username
		
		@valid = true
		begin
     		@profile_page = Nokogiri::HTML.parse(URI.open(@user_url))
    	rescue StandardError
      		@valid = false
      		return
    	end
		
		get_name
		get_nickname
		get_work
		get_bio
		get_location
		get_website
		get_pinned_repos
		get_counters
	end

	def get_name
		name = @profile_page.css('span.p-name')
		name ? @user.name = name.text : @user.name = "![ field blank ]"
	end

	def get_nickname
		nickname = @profile_page.css('span.p-nickname')
		nickname ? @user.nickname = nickname.text : @user.nickname = '![ field blank ]'
	end

	def get_work
		work = @profile_page.css('span.p-org')[0]
		work ? @user.work = work.text : @user.work = '![ field blank ]'
	end

	def get_location
		location = @profile_page.css('span.p-label')[0]
		location ? @user.location = location.text : @user.location = "![ field blank ]"
	end

	def get_website
		website = @profile_page.css('li.vcard-detail a')[1]
		website ? @user.website = website.text : @user.website = "![ field blank ]"
	end

	def get_bio
		bio = @profile_page.css('div.user-profile-bio')[0]
		bio ? @user.bio = bio.text.gsub(/\n/, '') : @user.bio = "![ field blank ]"
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
		@user.pinned.each {|item| user_summary << item}
		
		user_summary
	end

	def get_pinned_repos
		pinned_repos = @profile_page.css('.pinned-item-list-item')
		pinned = []
		pinned_repos.each do |item|
			pinned << item.css('span.repo').text
		end
		@user.pinned = pinned
	end

	def get_counters
		nav = @profile_page.css('.UnderlineNav-item')
		nav.each do |item|
			@user.summary << item.css('.Counter').text.gsub(/\n/, '').gsub(' ', '').to_i
		end
		@user.summary
	end

	def get_page(page)
		page_url = @user_url + '?tab=' + page
		@html = Nokogiri::HTML.parse(URI.open(page_url))

		case 
		when page == 'repositories' then get_repos
		when page == 'stars' then get_stars
		when page == 'followers' then get_followers
		when page == 'following' then get_following
		else
			return ['Error!, category invalid']
		end
	end

	def get_repos
		repos = @html.css('li.public')
		counter = 1
		repoz = []
		repos.each do |repo|
		repoz << ("#{counter}. " + repo.css('h3').text.gsub(/\n/, '').gsub(' ', ''))
		counter += 1
		end
		repoz
	end

	def get_stars
		stars = @html.css('div.d-block')
		counter = 1
		starz = []
		stars.each do |star|
		starz << ("#{counter}. " + star.css('h3').text.gsub(/\n/, '').gsub(' ', ''))
		counter += 1
		end
		starz
	end

	def get_followers
		followers = @html.css('div.table-fixed')
		counter = 1
		followerz = []
		followers.each do |follower|
		followerz << ("#{counter}. " + follower.css('span.f4').text)
		counter += 1
		end
		followerz
	end

	def get_following
		following = @html.css('div.table-fixed')
		counter = 1
		followingz = []
		following.each do |user|
		followingz << ("#{counter}. " + user.css('span.f4').text)
		counter += 1
		end
		followingz
	end


end
