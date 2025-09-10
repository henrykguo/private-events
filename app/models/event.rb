class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendances
  has_many :attendee, through: :event_attendances, source: "User"
end
