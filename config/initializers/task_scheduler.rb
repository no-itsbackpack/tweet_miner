require 'rubygems'
require 'rufus/scheduler'
require 'rake'

load File.join(Rails.root, 'lib','tasks','tempfile.rake')

temp_files_cleaning_scheduler = Rufus::Scheduler.start_new

temp_files_cleaning_scheduler.in '1d' do
  system "rake miner:mine_tweets RAILS_ENV=#{Rails.env}"
end