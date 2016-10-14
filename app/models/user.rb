class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  validates :password_digest, presence: true
  has_secure_password

  def mood
    if self.nausea < self.happiness
      "happy"
    else
      "sad"
    end
  end

end
