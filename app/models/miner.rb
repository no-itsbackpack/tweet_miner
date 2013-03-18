class Miner 
  require 'twitter_feed'
  attr_accessor  :url

  def initialize(url)
    @url = url
  end

  def mine_tweets
    twitterfeed = TwitterFeed.new
    tweets = twitterfeed.get_tweets(url)
    save_tweets(tweets)
  end


  private 

  def save_tweets(tweets)
    tweets.each do |tweet|
      if !tweet_exists?(tweet)
        Tweet.create(:description => tweet[:description], :author=> tweet[:author])
      end
    end 
  end

  def tweet_exists?(tweet)
    Tweet.exists?(:author => tweet[:author], :description => tweet[:description])
  end
end
