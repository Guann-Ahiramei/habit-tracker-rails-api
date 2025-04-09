class ReminderMailer < ApplicationMailer
  def send_reminder(reminder)
    @user = reminder.habit.user
    @habit = reminder.habit
    return unless @user&.email & @habit&.name # Ensure both user and habit exist
    mail(
      to: @user.email, 
      subject: "Reminder for your habit: #{@habit.name}",
      body: "Hi #{@user.name},\n\nThis is a reminder for your habit: #{@habit.name}.\n\nKeep up the good work!",
      from: "kwenshinyee@gmail.com"
    )
  end
end
