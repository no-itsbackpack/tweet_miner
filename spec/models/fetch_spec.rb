require 'spec_helper'
 
describe Fetch do
  before :each do
    @fetch = Fetch.new('http://search.twitter.com/search.rss?q=quickquid')
  end

  describe '.request_twitter_feed' do

    it 'should respond with HTTP status code 200 if request is good' do
      @fetch.request_twitter_feed.code.should be_eql("200")
    end

    it 'should not respond with HTTP status code 200 if request is bad' do
      @fetch.url = "http://search.twitter.com/search.rss?"
      @fetch.request_twitter_feed.code.should_not be_eql("200")
    end
  end

  describe '.extract_xml' do

    it 'should return an xml string that can parsed' do
      xml = @fetch.extract_xml
      doc = Nokogiri::XML(xml)
      doc.errors.should be_empty
    end

    it 'should have xpath //items with children nodes' do
    end

    it 'should have xpath '//items' with '/author' as one of its children nodes' do
    end

    it 'should have xpath '//items' with '/title' as one of its children nodes' do
    end

    it 'should have xpath '//items' with '/description' as one of its children nodes' do 
    end
    
  end

end