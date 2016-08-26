class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  # validates :password, presence: true

  def mood
    if nausea > happiness
      "sad"
    else
      "happy"
    end
  end
end
