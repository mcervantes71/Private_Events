class Event < ApplicationRecord
  belongs_to :user
  has_many :attendees, dependent: :destroy

  validates :name, length: { in: 4..30 }, presence: true, uniqueness: true
  validates :details, length: { in: 4..50 }, presence: true
  validates :date, presence: true
  validates :location, presence: true

  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if date.present? && date < DateTime.now
      errors.add(:date, "Event can't be in the past")
    end
  end
end