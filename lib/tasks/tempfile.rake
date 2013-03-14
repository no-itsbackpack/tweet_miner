require 'rake'

namespace :miner do 
  task :mine_tweets => :environment do
     Miner.new('http://search.twitter.com/search.rss?q=quickquid&rpp=20').mine_tweets
  end
end