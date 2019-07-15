class Account < ApplicationRecord
  # Users
 has_many :users, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :users

 # Trainers
 has_many :educators, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :educators

 has_many :schedules, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :schedules

 # Clients
 has_many :students, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :students

 # Lessons
 has_many :bookings, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :bookings

end
