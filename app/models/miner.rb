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
    tweets_attrs.each do |tweet_attr|
      if uniq_tweet?(tweet_attr)
        Tweet.create(:description => tweet_attr[:description], :author=> tweet_attr[:author])
      end
    end 
  end

  def uniq_tweet?(tweet_attr)
    return Tweet.find_by_author_and_description(tweet_attr[:author],tweet_attr[:description]).nil?
  end
end
