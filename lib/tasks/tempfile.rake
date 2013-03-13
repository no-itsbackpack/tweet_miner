require 'rake'

namespace :miner do 
  task :mine_tweets => :environment do
     Miner.new('http://search.twitter.com/search.rss?q=quickquid').mine_tweets
  end
end