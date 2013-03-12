class Fetch
  attr_accessor :url
  require 'open-uri'
  require 'net/http'


  def initialize(url)
    @url = url
  end

  def build_uri_feed
    uri = URI.parse(@url)
  end

  def request_twitter_feed
    uri = build_uri_feed
    response = Net::HTTP.get_response(uri)
    return response
  end

  def extract_xml
   xml = request_twitter_feed.body
  end
end