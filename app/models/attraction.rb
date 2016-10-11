class Attraction < ActiveRecord::Base

  has_many :rides
  has_many :users, through: :rides

  # binding.pry

end
