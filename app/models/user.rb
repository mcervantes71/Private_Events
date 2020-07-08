class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  has_many :events, foreign_key: :creator_id, dependent: :destroy
  has_many :attendees, :foreign_key =>  'attendee_id'
  has_many :attended_events, :through => :attendees

  validates :full_name, presence: true
  validates :username, length: { in: 4..15 }, presence: true, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[\w+\-.]*\.[a-z]+\z/i }, presence: true, uniqueness: true
  validates :password, length: { in: 6..16 }, presence: true
end
