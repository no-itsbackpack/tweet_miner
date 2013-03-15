class TwitterFeed
  attr_accessor :url
  require 'open-uri'
  require 'net/http'
  require 'nokogiri'

  def get_tweets
    response = request_feed
    data  = extract_data_from_feed(response.body)
    tweets   = extract_tweets(data)
  end

  private

  def request_feed(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
  end

  def extract_data_from_feed(feed)
    Nokogiri::XML(feed)
  end

  def extract_tweets(data)
    return [] if data.empty?
    tweets = data.xpath('//item')
    tweets = remove_invalid_authors(tweets)
    tweets.map{|i| {:description => i.xpath('title').inner_text, :author => i.xpath('author').inner_text}}
  end

  def remove_invalid_authors(data)
    data.select {|i| i.xpath('author').inner_text != "QuickQuid@twitter.com (QuickQuid)"}
  end

end