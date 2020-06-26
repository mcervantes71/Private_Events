class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  validates :full_name, presence: true
  validates :username, length: { in: 4..15 }, presence: true, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[\w+\-.]*\.[a-z]+\z/i }, presence: true, uniqueness: true
  validates :password, length: { in: 6..16 }, presence: true
end
