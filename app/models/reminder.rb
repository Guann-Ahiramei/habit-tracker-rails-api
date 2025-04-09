class Reminder < ApplicationRecord
  belongs_to :habit

  # after_create :enqueue_reminder_job

  private

  def enqueue_reminder_job
    ReminderJob.perform_later(self.id)
  end
end
