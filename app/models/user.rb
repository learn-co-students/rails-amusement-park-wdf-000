class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  after_initialize :defaults_admin_to_false

  def mood
    if self.nausea && self.happiness
      return 'sad' if self.nausea > self.happiness
      return 'happy' if self.nausea < self.happiness
    end
  end



  private

  def defaults_admin_to_false
    if !admin
      admin = false
    end
  end
end
