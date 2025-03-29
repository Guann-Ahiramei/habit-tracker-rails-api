class ReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # 根据需要添加提醒内容
    reminder = Reminder.find_by(id: reminder_id)
    return unless reminder

    user = reminder.habit.user
    ReminderMailer.send_reminder(user, reminder.habit).deliver_now
  end
end
