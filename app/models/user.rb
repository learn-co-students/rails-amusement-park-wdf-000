class User < ActiveRecord::Base
  # write associations here
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if happiness && nausea
      happiness < nausea ? "sad" : "happy"
    else
      ["sad", "happy"].sample
    end
  end
end
