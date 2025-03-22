class TimeBlock < ApplicationRecord
  belongs_to :habit
  validates :start_time, :end_time, presence: true
  validates :completed, inclusion: { in: [true, false] }
end
