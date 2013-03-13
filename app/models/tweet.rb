class Tweet < ActiveRecord::Base
  attr_accessible :author, :description

  validates_length_of :description, :minimum =>1,:maximum=>140, :allow_blank => false
end
