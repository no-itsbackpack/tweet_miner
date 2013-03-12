require 'spec_helper'

describe Miner do
  # before :each do
  #   #@miner = Miner.new(url:'http://search.twitter.com/search.rss?q=quickquid')
  #   #@xml_doc = Nokogiri::HTML(open(@miner.url))
  #   WebMock.stub_request(:any,"www.example")
  # end


  # describe '.request_twitter_feed' do
  #   before do
  #     uri = URI.parse('http://search.twitter.com/search.rss?q=quickquid')
  #     response = Net::HTTP.get_response(uri)
  #   end

  #   it 'should respond with HTTP status code 200 if request is good' do
  #     uri = URI.parse('http://search.twitter.com/search.rss?q=quickquid')
  #     response = Net::HTTP.get_response(uri)
  #     respond.code.should be_eql("200")
  #   end

  #   it 'should not respond with HTTP status code 200 if request is bad' do
  #     uri = URI.parse('http://search.twitter.com/search.rss')
  #     response = Net::HTTP.get_response(uri)
  #     respond.code.should_not be_eql("200")
  #   end

  #   it 'should have .xpath('//items').xpath('author') format to access the tweet author' do
  #   end

  #   it 'should have .xpath('//items').xpath('author') format to access the tweet description' do 
  #   end
  # end
  #describe '.fetch' do
    #does api respond correctly
    #talks to twitter
    #twitter responds
    #make sure twitter repsonds correctly
    #Net::http
  #   it 'searches for term' do
  #     Miner.fetch('search-term')
  #   end

  #   it 'searches for terms later than timestamp'
  #     Miner.fetch('search-term', Time.now)
  #   end
  # end

  # describe '.parse' do
  #   #assume api fixed
  #   #
  #   it 'is empty for empty results' do
  #     Miner.parse('').should be_empty
  #   end

  #   it 'is [{author: "", description: ""}] for one result' do
  #     data = Miner.parse('')
  #     data.length.should == 1
  #     data.first.should == {}
  #   end
  # end

  # describe '.scrape_twitter_for_tweets' do
  #   it 'should use nokogiri' do
  #     #Nokogiri.should_receive(:HTML)
  #     #@scrape.scrape_twitter_for_tweets
  #   end

  #   it 'should connect with twitter using url' do
  #     #@scrape.should_receive(:open).with(@scrape.url)
  #     #@scrape.scrape_twitter_for_tweets
  #   end
  # end

  # describe '.extract_tweets_from_xml' do
  #   before do
  #     @xml_doc = Nokogiri::HTML(open(@scrape.url))
  #     #@xml_doc = Nokogiri::HTML(File.read())
  #   end

  #   it 'should return an array' do
  #     @scrape.extract_tweets_from_xml(@xml_doc).should be_an(Array)
  #   end

  #   it 'should not return an empty array' do
  #     @scrape.extract_tweets_from_xml(@xml_doc).should_not be_empty
  #   end

  #   it 'should raise NoMethodError if wrong paramter is passed in' do
  #   expect{
  #     @scrape.extract_tweets_from_xml("string")
  #   }.to raise_error
  #   end
  # end

  # describe '.save_tweets' do
  #   it 
  # end
end
