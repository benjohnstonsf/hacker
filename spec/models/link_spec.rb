require 'spec_helper'

describe Link do
  it "requires a url" do
    should_not be_valid
    subject.errors[:url].should_not be_empty
  end
  it "requires a title" do
    should_not be_valid
    subject.errors[:title].should_not be_empty
  end
  it "rejects duplicate urls" do
    Link.create!(:title => "one", :url => "http://www.squareup.com")
    l = Link.new(:title => "two", :url => "www.squareup.com")
    l.should_not be_valid
    l.errors[:url].should_not be_empty
  end
  it 'should be a valid url' do 
    l = Link.new(:title => "two", :url => "12345")
    l.should_not be_valid
  end
  
  context 'with votes' do
    before :each do
      @l = Link.create!(:title => "one", :url => "http://www.squareup.com")
    end
    
    it 'should have a vote count' do
      @l.votes.count.should be_zero
    end
    
    it 'should be able to upvote' do
      expect {
        @l.votes.create
      }.to change{@l.vote_count}.by(1)
    end
    
  end
  
  
end


