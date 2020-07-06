class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendees, dependent: :destroy

  validates :name, length: { in: 4..30 }, presence: true, uniqueness: true
  validates :details, length: { in: 4..50 }, presence: true
  validates :date, presence: true
  validates :location, presence: true

  # validate :date_cannot_be_in_the_past
  #
  # def date_cannot_be_in_the_past
  #   errors.add(:date, "Event can't be in the past") if date.present? && date < DateTime.now
  # end

  scope :upcoming, -> { where('date > ?', Time.zone.now) }
  scope :previous, -> { where('date <= ?', Time.zone.now) }
end
