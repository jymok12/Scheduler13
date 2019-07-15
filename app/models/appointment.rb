class Appointment < ApplicationRecord
has_many :educators, :through => :bookings

has_many :students, :through => :bookings

has_many :bookings, :inverse_of => :lessons
accepts_nested_attributes_for :bookings

mount_uploader :image, LessonUploader
end
