class DashboardController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index]
  before_action :authenticate_user!
  
  def index
    @habits = Habit.where(user_id: session[:user_id])
    @completed_count = TimeBlock.joins(:habit).where(habits: { user_id: session[:user_id] }, completed: true).count
    @incomplete_count = TimeBlock.joins(:habit).where(habits: { user_id: session[:user_id] }, completed: false).count
    # 统计时间块数据
    total_time_blocks = TimeBlock.where(habit: @habits).count
    completed_time_blocks = TimeBlock.where(habit: @habits, completed: true).count
    @completion_rate = total_time_blocks.zero? ? 0 : (completed_time_blocks.to_f / total_time_blocks * 100).round(2)
    
    @daily_stats = TimeBlock.where(habit: @habits).group_by_day(:start_time).count
    @weekly_stats = TimeBlock.where(habit: @habits).group_by_week(:start_time).count
  end
end
