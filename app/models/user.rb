class User < ActiveRecord::Base
  has_secure_password
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  
  # validates_presence_of :password, allow_blank: false

  def mood
    if happiness && nausea
      happiness >= nausea ? 'happy' : 'sad'
    else
      ['happy', 'sad'].sample
    end
  end
end
