class Questionresult < ActiveRecord::Base
  attr_accessible :answer

  belongs_to :question
end
