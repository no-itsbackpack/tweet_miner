class TwitterFeed
  attr_accessor :url
  require 'open-uri'
  require 'net/http'
  require 'nokogiri'


  def initialize(url)
    @url = url
  end

  def request_twitter_feed
    uri = URI.parse(@url)
    response = Net::HTTP.get_response(uri)
    return response
  end

  def extract_xml_from_twitter_feed(feed)
    Nokogiri::XML(feed)
  end

  def extract_tweets_from_xml(xml_doc)
    xml_doc.class == Nokogiri::XML::Document ? xml_doc.xpath('//item').select {|i| i.xpath('author').inner_text != "QuickQuid@twitter.com (QuickQuid)"}.map{|i| {:description => i.xpath('title').inner_text, :author => i.xpath('author').inner_text}} : []
  end

  def get_tweets_attrs
    response = request_twitter_feed
    xml_doc  = extract_xml_from_twitter_feed(response.body)
    tweets   = extract_tweets_from_xml(xml_doc)
    return tweets 
  end

end