class Staff < ApplicationRecord
  has_many :meetings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def username
    return self.email.split('@')[0].capitalize
  end
end
