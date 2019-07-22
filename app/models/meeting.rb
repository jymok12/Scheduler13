class Meeting < ApplicationRecord
  belongs_to :staff
  has_many :likes, dependent: :destroy
end
