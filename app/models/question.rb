class Question < ActiveRecord::Base
  attr_accessible :content

  belongs_to :survey

  has_many :questionresults, :dependent => :destroy

  validates :content, :presence => true
end
