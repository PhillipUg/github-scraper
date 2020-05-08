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

  describe '#name' do
    it 'should get scrapped name and set it to user name' do
      result = scraper1.send(:name)
      expect(result).to eq('Phillip Musiime')
    end
  end

  describe '#nickname' do
    it 'should get scrapped nickname and set it to user nickname' do
      result = scraper1.send(:nickname)
      expect(result).to eq('PhillipUg')
    end
  end

  describe '#work' do
    it 'should get scrapped work and set it to user work' do
      result = scraper1.send(:work)
      expect(result).to eq('Freelance Full Stack Developer')
    end
  end

  describe '#location' do
    it 'should get scrapped location and set it to user location' do
      result = scraper1.send(:location)
      expect(result).to eq('remote')
    end
  end

  describe '#website' do
    it 'should get scrapped website and set it to user website' do
      result = scraper1.send(:website)
      expect(result).to eq('https://www.linkedin.com/in/phillip-musiime-74657019a/')
    end
  end

  describe '#bio' do
    it 'should get scrapped bio and set it to user bio' do
      result = scraper1.send(:bio)
      expect(result).to eq('JavaScript, Ruby, Ruby on Rails, React, SQL, HTML/CSS --Open to new job opportunities.')
    end
  end

  describe '#pinned_repos' do
    it 'should get scrapped pinned repos and set it to user pinned repos' do
      result = scraper1.send(:pinned_repos)
      expect(result).to include('bubble-sort')
    end

    it 'should return an array of pinned repositories' do
      result = scraper1.send(:pinned_repos)
      expect(result).to be_an Array
    end
  end

  describe '#profile_info' do
    it 'should add all user info to an array' do
      expect(scraper1.profile_info).to be_an Array
    end

    it 'returned array should include user info' do
      result = scraper1.profile_info
      expect(result).to include('remote')
    end
  end

  describe '#counters' do
    it 'should get scrapped number of each category and add it to user summary array' do
      result = scraper1.send(:counters)
      expect(result).to be_an Array
    end

    it 'returned array should include numbers of each category' do
      result = scraper1.send(:counters)
      expect(result.any?(Integer)).to be true
    end
  end

  describe '#page' do
    it 'should return error if category is invalid' do
      expect(scraper1.page('shopping')).to eq(['Error!, category invalid'])
    end

    it 'should return an array if valid' do
      expect(scraper1.page('repositories')).to be_an Array
    end

    it 'returned array should include category items' do
      result = scraper1.page('repositories')
      expect(result).to include('github-scraper')
    end
  end

  describe '#repos' do
    it 'should get scrapped user repos and add them to an array' do
      result = scraper1.send(:page, 'repositories')
      expect(result).to be_an Array
    end
  end

  describe '#stars' do
    it 'should get scrapped user stars and add them to an array' do
      result = scraper1.send(:page, 'stars')
      expect(result).to be_an Array
    end
  end

  describe '#followers' do
    it 'should get scrapped user followers and add them to an array' do
      result = scraper1.send(:page, 'followers')
      expect(result).to be_an Array
    end
  end

  describe '#following' do
    it 'should get scrapped user following and add them to an array' do
      result = scraper1.send(:page, 'following')
      expect(result).to be_an Array
    end
  end
end
