class User < ActiveRecord::Base

  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides


  # validates :password, :presence => true
  # validates :password,:presence=>true, :on=>:create
  # validates :password, length: {minimum: 1}, allow_blank: false

  # binding.pry

  def mood
    # binding.pry
    if self.nausea && self.happiness
      if self.nausea > self.happiness
         "sad"
      else
         "happy"
      end
    end
  end




end
