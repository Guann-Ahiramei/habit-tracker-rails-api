class ReminderJob < ApplicationJob
  queue_as :default

  def perform(reminder_id)
    # 根据需要添加提醒内容
    reminder = Reminder.find_by(id: reminder_id)
    return unless reminder

    ReminderMailer.send_reminder(reminder).deliver_now
  end
end
