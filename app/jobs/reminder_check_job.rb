class ReminderCheckJob < ApplicationJob
  queue_as :default

  def perform
    now = Time.current
    reminders = Reminder.where("reminder_time <= ?", now)

    reminders.find_each do |reminder|
      HabitReminderJob.perform_later(reminder.id)
      reminder.destroy # 发送后删除提醒
    end
  end
end
