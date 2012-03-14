class Link < ActiveRecord::Base
  validates :url, :presence => true, :uniqueness => true, :format => {:with => URI.regexp}
  validates :title, :presence => true
  
  has_many :votes
  
  def vote_count
    votes.count
  end

end
