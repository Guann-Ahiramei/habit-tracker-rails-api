class User < ApplicationRecord
  has_secure_password
  has_many :habits, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: %w[user admin] }
end
