class Booking < ApplicationRecord
belongs_to :account, :inverse_of => :bookings
accepts_nested_attributes_for :account

belongs_to :appointment, :inverse_of => :bookings
accepts_nested_attributes_for :appointment

belongs_to :schedule, :inverse_of => :bookings
accepts_nested_attributes_for :schedule

belongs_to :educator, :inverse_of => :bookings
accepts_nested_attributes_for :educator

belongs_to :student, :inverse_of => :bookings
accepts_nested_attributes_for :student

 validates :schedule_id, presence: true
 
end
