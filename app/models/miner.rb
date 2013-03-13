class Miner < ActiveRecord::Base
  require 'twitter_feed'
  has_many :tweets
  attr_accessible :url


  def mine_tweets
    twitterfeed = TwitterFeed.new(url)
    tweets_attrs = twitterfeed.get_tweets_attrs
    save_tweets(tweets_attrs)
  end


  private 

  def save_tweets(tweets_attrs)
    tweets_attrs.each do |tweet_attrs|
      description = tweet_attrs[:title]
      author  = tweet_attrs[:author]

      Tweet.create(:description => description, :author=>author, :miner => self) #if author != "QuickQuid@twitter.com (QuickQuid)"
    end 
  end


end
