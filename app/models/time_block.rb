class TimeBlock < ApplicationRecord
  belongs_to :habit
  validates :start_time, :end_time, presence: true
  validates :completed, inclusion: { in: [true, false] }

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?
    errors.add(:end_time, '必须晚于开始时间') if end_time < start_time
  end

# 未完成时必须填写原因
  def reason_required_if_incomplete
    return if completed? || reason.present?
    errors.add(:reason, '未完成时必须填写原因')
  end

end
