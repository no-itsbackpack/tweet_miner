require 'spec_helper'
describe TwitterFeed do
  before :each do
    @twitterfeed = TwitterFeed.new
    @url  = 'http://search.twitter.com/search.rss?q=quickquid&rpp=20'
    @feed = File.open(File.dirname(__FILE__) + "/Feed.txt")
    #@data = Nokogiri::XML(File.open(File.dirname(__FILE__) + "/Twitter.xml"))
    #@data = Nokogiri::
  end

  describe '.request_twitter_feed' do

    it 'responds with HTTP status code 200 if request is good' do
      @twitterfeed.send(:request_feed, @url).code.should eql('200')
    end

    it 'should not respond with HTTP status code 200 if request is bad' do
      url = "http://search.twitter.com/search.rss?"
      @twitterfeed.send(:request_feed, url).code.should_not eql('200')
    end
  end

  describe '.extract_data_from_feed' do

    it 'returns errors when an empty feed is passed in' do
      doc = @twitterfeed.send(:extract_data_from_feed," ")
      doc.to_s.should_not have_xpath('//item')
    end

    it 'returns errors when an invalid feed is passed in' do
      doc = @twitterfeed.send(:extract_data_from_feed,"feed")  
      doc.to_s.should_not have_xpath('//item')
    end

    it 'returns data that has an xpath' do 
      doc = @twitterfeed.send(:extract_data_from_feed, @feed)
      doc.to_s.should have_xpath('//item')
    end

    it 'returns data that has both description and author tags' do
      doc = @twitterfeed.send(:extract_data_from_feed, @feed)#.each do |data|
      
      doc.to_s.should have_xpath('//item/author')
      doc.to_s.should have_xpath('//item/description')

    end
  end

  describe '.extract_tweets' do
    before :each do
      @data = @twitterfeed.send(:extract_data_from_feed, @feed)
    end

    it 'raises an error when passed invalid data' do
      expect { @twitterfeed.send(:extract_tweets,' ') }.to raise_error
    end

    it 'returns an array when passed a valid data' do
      
      @twitterfeed.send(:extract_tweets, @data).should be_kind_of(Array)
    end

    
    it 'returns array of hashes with keys author and description' do 
      @twitterfeed.send(:extract_tweets, @data).each do |hash|
        hash.should have_key(:description)
        hash.should have_key(:author)
      end
    end
  end

end