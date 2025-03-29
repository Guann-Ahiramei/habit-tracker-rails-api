every 1.day, at: '8:00 am' do
  runner "ReminderJob.perform_later(user.id)"
end
