class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  validates :password, presence: true, on: :create

  def mood
    if self.happiness && self.nausea 
       self.happiness > self.nausea ? "happy" : "sad"
    end
  end
  
end