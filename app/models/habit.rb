class Habit < ApplicationRecord
  belongs_to :user
  has_many :time_blocks, dependent: :destroy
  has_and_belongs_to_many :categories
  validates :name, presence: true
  has_many :reminders, dependent: :destroy
end
