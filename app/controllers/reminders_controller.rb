class RemindersController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  before_action :set_habit

  def new
    @reminder = @habit.reminders.new
  end

  def create
    @reminder = @habit.reminders.build(reminder_params)
    if @reminder.save
      redirect_to @habit, notice: '提醒已设置'
    else
      redirect_to @habit, alert: '无法设置提醒'
    end
  end

  def destroy
    @reminder = @habit.reminders.find(params[:id])
    @reminder.destroy
    redirect_to @habit, notice: '提醒已删除'
  end

  private

  def reminder_params
    params.require(:reminder).permit(:reminder_time)
  end

  def set_habit
    @habit = Habit.find_by(id: params[:habit_id])
  end
end
