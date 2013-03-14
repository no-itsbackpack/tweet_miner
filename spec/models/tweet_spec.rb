require 'spec_helper'
 
describe Tweet do
  before :each do
    @tweet = Tweet.new(description:"Thanks Quickquid", author:"@myslave")
  end

  subject {@tweet}

  it { should respond_to(:description)}
  it { should respond_to(:author)}
  it { should be_valid}

  describe "when length of description is greater than 140" do
    before { @tweet.description = "a"*141 }

    it {should_not be_valid}
  end

  describe "when length of description is less than 1" do
    before {@tweet.description = ""}

    it {should_not be_valid}
  end
  
end
