class Survey < ActiveRecord::Base
  attr_accessible :name

  has_many :questions, :dependent => :destroy

  validates :name,  :presence => true,
    :length   => { :maximum => 50 },
    :uniqueness => true
end
