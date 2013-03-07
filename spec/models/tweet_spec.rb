require 'spec_helper'

describe Tweet do
  before :each do
    miner = Miner.create
    @tweet = Tweet.new(description:"Thanks Quickquid", author:"@myslave").tap do |qq|
      qq.miner = miner
    end
  end

  subject {@tweet}

  it { should respond_to(:description)}
  it { should respond_to(:author)}
  it { should be_valid}

  describe "when scrape is not present" do
    before { @tweet.tap {|qq| qq.miner = nil}}
      it {should_not be_valid}
  end

  describe "when length of description is greater than 140" do
    before { @tweet.description = "a"*141 }
      it {should_not be_valid}
  end

  describe "when length of description is less than 1" do
    before {@tweet.description = ""}
      it {should_not be_valid}
  end
end
