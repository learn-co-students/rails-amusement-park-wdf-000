class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides 
  
#   validates :name, presence: true
  validates :password,:presence=>true,:length=>{:minimum=>6},:on=>:create

  def mood
    if nausea > happiness
      'sad'
    else
      'happy'
    end
  end
end
