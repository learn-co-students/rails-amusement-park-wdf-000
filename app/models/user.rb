class User < ActiveRecord::Base
  # write associations here
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  # validates :password, presence: true

  def mood
    (nausea > happiness ? 'sad' : 'happy') if nausea && happiness
  end

end
