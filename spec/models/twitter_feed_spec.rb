require 'spec_helper'

describe TwitterFeed do
  before :each do
    @twitterfeed = TwitterFeed.new('http://search.twitter.com/search.rss?q=quickquid')

    @xml_doc = Nokogiri::XML(File.open(File.dirname(__FILE__) + "/Twitter.xml"))
  end

  describe '.request_twitter_feed' do

    it 'responds with HTTP status code 200 if request is good' do
      @twitterfeed.request_twitter_feed.code.should be_eql("200")
    end

    it 'should not respond with HTTP status code 200 if request is bad' do
      @twitterfeed.url = "http://search.twitter.com/search.rss?"
      @twitterfeed.request_twitter_feed.code.should_not be_eql("200")
    end
  end

  describe '.extract_xml_from_twitter_feed' do

    it 'returns no errors when valid feed is passed in' do
      response = @twitterfeed.request_twitter_feed
      xml_doc  = @twitterfeed.extract_xml_from_twitter_feed(response.body)
      xml_doc.errors.should be_empty
    end

    it 'returns errors when an empty feed is passed in' do
      xml_doc = @twitterfeed.extract_xml_from_twitter_feed(" ") 
      xml_doc.errors.should_not be_empty
    end

    it 'returns errors when an invalid feed is passed in' do
      xml_doc = @twitterfeed.extract_xml_from_twitter_feed("feed") 
      xml_doc.errors.should_not be_empty
    end
  end

  describe '.extract_tweets_from_xml' do
    it 'is empty for invalid xml' do
      @twitterfeed.extract_tweets_from_xml('').should be_empty
    end

    it 'returns an array when passed a valid xml' do
      @twitterfeed.extract_tweets_from_xml(@xml_doc).should be_kind_of(Array)
    end

    
    it 'returns array of hashes with keys author and description' do 
      @twitterfeed.extract_tweets_from_xml(@xml_doc).each do |hash|
        hash.keys.count.should be_eql(2)
        hash.keys.should include(:description, :author)
      end
    end
  end

end