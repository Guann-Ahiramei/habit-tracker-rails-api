class Api::V1::RemindersController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  before_action :set_habit
  def index
    @reminders = @habit.reminders
    render json: @reminders, status: :ok
  end

  def create
    @reminder = @habit.reminders.build(reminder_params)
    if @reminder.save
      render json: @reminder, status: :created
    else
      render json: @reminder.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reminder = @habit.reminders.find(params[:id])
    @reminder.destroy
    render json: { message: 'Reminder deleted successfully' }, status: :ok
  end

  private

  def reminder_params
    params.require(:reminder).permit(:reminder_time)
  end

  def set_habit
    @habit = Habit.find_by(id: params[:habit_id])
  end
end
