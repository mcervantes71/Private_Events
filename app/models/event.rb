class Event < ApplicationRecord
  belongs_to :user
  has_many :attendees, dependent: :destroy

  validates :name, length: { in: 4..30 }, presence: true, uniqueness: true
  validates :details, length: { in: 4..50 }, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
