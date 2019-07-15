class Student < ApplicationRecord
  # Tenant Of
  belongs_to :account, :inverse_of => :students
  accepts_nested_attributes_for :account

  belongs_to :user, :inverse_of => :students
  accepts_nested_attributes_for :user

  has_many :bookings, dependent: :destroy, :inverse_of => :student
  accepts_nested_attributes_for :bookings

  has_many :appointments, :through => :bookings

  #mount_uploader :photo, StudentUploader

  def name
    "#{first_name} #{last_name}"
  end

  def email
    User.find_by_id(self.user_id)
  end
end
