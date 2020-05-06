require 'scraper'

RSpec.describe Scraper do
  let(:scraper1) { Scraper.new('phillipug') }

  describe '#initialize' do
    it 'should be initialied with a valid Github Username' do
      expect(scraper1.valid).to be true
    end
    let(:scraper2) { Scraper.new('wetretsdcasdasd') }
    it 'should return false when username is invalid' do
      expect(scraper2.valid).to be false
    end
  end

  describe '#get_name' do
    it 'should get scrapped name and set it to user name' do
      expect(scraper1.get_name).to eq('Phillip Musiime')
    end
  end

  describe '#get_nickname' do
    it 'should get scrapped nickname and set it to user nickname' do
      expect(scraper1.get_nickname).to eq('PhillipUg')
    end
  end

  describe '#get_work' do
    it 'should get scrapped work and set it to user work' do
      expect(scraper1.get_work).to eq('Freelance Full Stack Developer')
    end
  end

  describe '#get_location' do
    it 'should get scrapped location and set it to user location' do
      expect(scraper1.get_location).to eq('remote')
    end
  end

  describe '#get_website' do
    it 'should get scrapped website and set it to user website' do
      expect(scraper1.get_website).to eq('https://www.linkedin.com/in/phillip-musiime-74657019a/')
    end
  end

  describe '#get_bio' do
    it 'should get scrapped bio and set it to user bio' do
      expect(scraper1.get_bio).to eq('JavaScript, Ruby, Ruby on Rails, React, SQL, HTML/CSS --Open to new job opportunities.')
    end
  end

  describe '#get_pinned_repos' do
    it 'should get scrapped pinned repos and set it to user pinned repos' do
      result = scraper1.get_pinned_repos
      expect(result).to include('bubble-sort')
    end

    it 'should return an array of pinned repositories' do
      expect(scraper1.get_pinned_repos).to be_an Array
    end
  end

  describe '#get_profile_info' do
    it 'should add all user info to an array' do
      expect(scraper1.get_profile_info).to be_an Array
    end

    it 'returned array should include user info' do
      result = scraper1.get_profile_info
      expect(result).to include('remote')
    end
  end

  describe '#get_counters' do
    it 'should get scrapped number of each category and add it to user summary array' do
      expect(scraper1.get_counters).to be_an Array
    end

    it 'returned array should include numbers of each category' do
      result = scraper1.get_counters
      expect(result.any?(Integer)).to be true
    end
  end

  describe '#get_page' do
    it 'should return error if category is invalid' do
      expect(scraper1.get_page('shopping')).to eq(['Error!, category invalid'])
    end

    it 'should return an array if valid' do
      expect(scraper1.get_page('repositories')).to be_an Array
    end

    it 'returned array should include category items' do
      result = scraper1.get_page('repositories')
      expect(result).to include('1. web-scraper')
    end
  end

  describe '#get_repos' do
    it 'should get scrapped user repos and add them to an array' do
      expect(scraper1.get_page('repositories')).to be_an Array
    end
  end

  describe '#get_stars' do
    it 'should get scrapped user stars and add them to an array' do
      expect(scraper1.get_page('stars')).to be_an Array
    end
  end

  describe '#get_followers' do
    it 'should get scrapped user followers and add them to an array' do
      expect(scraper1.get_page('followers')).to be_an Array
    end
  end

  describe '#get_following' do
    it 'should get scrapped user following and add them to an array' do
      expect(scraper1.get_page('following')).to be_an Array
    end
  end
end
