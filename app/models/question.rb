class Question < ActiveRecord::Base
  attr_accessible :content

  belongs_to :survey

  validates :content, :presence => true
end
