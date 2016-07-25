class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if nausea && happiness
      if nausea > happiness
        "sad"
      elsif
        happiness > nausea
        "happy"
      end
    end
  end
end
