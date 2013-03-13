class Miner 
  require 'twitter_feed'
  attr_accessor  :url

  def initialize(url)
    @url = url
  end

  def mine_tweets
    twitterfeed = TwitterFeed.new(@url)
    tweets_attrs = twitterfeed.get_tweets_attrs
    save_tweets(tweets_attrs)
  end


  private 

  def save_tweets(tweets_attrs)
    tweets_attrs.each do |tweet_attrs|
      description = tweet_attrs[:description]
      author  = tweet_attrs[:author]

      Tweet.create(:description => description, :author=>author) #if author != "QuickQuid@twitter.com (QuickQuid)"
    end 
  end


end
