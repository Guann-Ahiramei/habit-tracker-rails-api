class ReminderMailer < ApplicationMailer
  def send_reminder(user, habit)
    @user = user
    @habit = habit
    mail(to: @user.email, subject: "提醒：该做 <%= @habit.name %> 了！")
  end
end
