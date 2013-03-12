class Miner < ActiveRecord::Base
  has_many :tweets
  attr_accessible :url
end
