class User < ApplicationRecord
            # Include default devise modules.
            devise :database_authenticatable, :registerable,
                    :recoverable, :rememberable, :validatable,:omniauthable
                #     :confirmable,
            include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :habits, dependent: :destroy

  # 关注关系
  has_many :follows_as_follower, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :followed_users, through: :follows_as_follower, source: :followed

  has_many :follows_as_followed, class_name: 'Follow', foreign_key: 'followed_id'
  has_many :followers, through: :follows_as_followed, source: :follower

  has_one_attached :avatar

  validates :email, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: %w[user admin] }
  validate :acceptable_avatar

  before_validation :set_default_role, on: :create

  def set_default_role
    self.role ||= 'user'
  end

  private

  def acceptable_avatar
    return unless avatar.attached?

    unless avatar.byte_size <= 1.megabyte
      errors.add(:avatar, "is too big. Maximum size is 1MB.")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
      errors.add(:avatar, "must be a JPEG or PNG.")
    end
  end
end
