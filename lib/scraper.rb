require_relative 'user.rb'

require 'nokogiri'
require 'open-uri'

class Scraper
  attr_reader :valid, :username

  URL = 'https://github.com/'.freeze

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

    name
    nickname
    work
    bio
    location
    website
    pinned_repos
    counters
  end

  def name
    name = @profile_page.css('span.p-name')
    @user.name = (name ? name.text : '![ field blank ]')
  end

  def nickname
    nickname = @profile_page.css('span.p-nickname')
    @user.nickname = (nickname ? nickname.text : '![ field blank ]')
  end

  def work
    work = @profile_page.css('span.p-org')[0]
    @user.work = (work ? work.text : '![ field blank ]')
  end

  def location
    location = @profile_page.css('span.p-label')[0]
    @user.location = (location ? location.text : '![ field blank ]')
  end

  def website
    website = @profile_page.css('li.vcard-detail a')[1]
    @user.website = (website ? website.text : '![ field blank ]')
  end

  def bio
    bio = @profile_page.css('div.user-profile-bio')[0]
    @user.bio = (bio ? bio.text.gsub(/\n/, '') : '![ field blank ]')
  end

  def profile_info
    user_summary = []
    [
      @user.name,
      @user.nickname,
      @user.bio,
      @user.work,
      @user.location,
      @user.website
    ].each { |item| user_summary << item }

    @user.summary.each { |item| user_summary << item }
    @user.pinned.each { |item| user_summary << item }

    user_summary
  end

  def pinned_repos
    pinned_repos = @profile_page.css('.pinned-item-list-item')
    pinned = []
    pinned_repos.each do |item|
      pinned << item.css('span.repo').text
    end
    @user.pinned = pinned
  end

  def counters
    nav = @profile_page.css('.UnderlineNav-item')
    nav.each do |item|
      @user.summary << item.css('.Counter').text.gsub(/\n/, '').gsub(' ', '').to_i
    end
    @user.summary
  end

  def page(page)
    page_url = @user_url + '?tab=' + page
    @html = Nokogiri::HTML.parse(URI.open(page_url))

    if page == 'repositories' then get_repos
    elsif page == 'stars' then get_stars
    elsif page == 'followers' then get_followers
    elsif page == 'following' then get_following
    else
      ['Error!, category invalid']
    end
  end

  def repos
    repos = @html.css('li.public')
    counter = 1
    repoz = []
    repos.each do |repo|
      repoz << ("#{counter}. " + repo.css('h3').text.gsub(/\n/, '').gsub(' ', ''))
      counter += 1
    end
    repoz
  end

  def stars
    stars = @html.css('div.d-block')
    counter = 1
    starz = []
    stars.each do |star|
      starz << ("#{counter}. " + star.css('h3').text.gsub(/\n/, '').gsub(' ', ''))
      counter += 1
    end
    starz
  end

  def followers
    followers = @html.css('div.table-fixed')
    counter = 1
    followerz = []
    followers.each do |follower|
      followerz << ("#{counter}. " + follower.css('span.f4').text)
      counter += 1
    end
    followerz
  end

  def following
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
