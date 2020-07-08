class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendees, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendees, source: :attendee

  validates :name, length: { in: 4..30 }, presence: true, uniqueness: true
  validates :details, length: { in: 4..50 }, presence: true
  validates :date, presence: true
  validates :location, presence: true

  scope :upcoming, -> { where('date > ?', Time.zone.now) }
  scope :previous, -> { where('date <= ?', Time.zone.now) }
end
