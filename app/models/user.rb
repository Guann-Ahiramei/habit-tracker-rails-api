class User < ApplicationRecord
  has_secure_password
  has_many :habits, dependent: :destroy

  # 关注关系
  has_many :follows_as_follower, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :followed_users, through: :follows_as_follower, source: :followed

  has_many :follows_as_followed, class_name: 'Follow', foreign_key: 'followed_id'
  has_many :followers, through: :follows_as_followed, source: :follower

  validates :email, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: %w[user admin] }
end
