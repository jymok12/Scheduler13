class Home < ApplicationRecord
  belongs_to :account, :inverse_of => :schedules
  accepts_nested_attributes_for :account

  belongs_to :educator, :inverse_of => :schedules
  accepts_nested_attributes_for :educator

  has_many :bookings, :inverse_of => :schedule
  accepts_nested_attributes_for :bookings

  validates :start, uniqueness: { scope: :trainer_id, message: "You have already made this time available" }

end
