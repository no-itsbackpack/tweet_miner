class Tweet < ActiveRecord::Base
  belongs_to :miner
  attr_accessible :author, :description

  validates :miner, presence: true
  validates_length_of :description, :minimum =>1,:maximum=>140, :allow_blank => false
end
