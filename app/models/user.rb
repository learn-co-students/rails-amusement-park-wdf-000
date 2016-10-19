class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  after_initialize :make_default
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  # write associations here
  has_secure_password

   def mood
     if self.nausea > self.happiness
     "sad"
   else
     "happy"
    end
   end
private
   def make_default
     self.admin ||= false
   end
end
