class Tweet < ActiveRecord::Base
  attr_accessible :author, :description
end
