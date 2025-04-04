class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:show, :index, :create, :follow, :unfollow]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice:'user sign up successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    @friends_stats = @user.followed_users.map do |friend|
      {
        friend: friend,
        daily_completion_rate: habit_completion_rate(friend, period: :daily),
        weekly_completion_rate: habit_completion_rate(friend, period: :weekly)
      }
    end
    @followed_users = @user.followed_users
    @followers = @user.followers
  end

  def index
    @users = User.all
    render :index, notice: "login successfully"
  end

  def follow
    @user = User.find(params[:id])
    current_user.followed_users << @user unless current_user.followed_users.include?(@user)
    redirect_to @user, notice: "You are now following #{@user.email}"
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.delete(@user)
    redirect_to @user, notice: "You have unfollowed #{@user.email}"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end

  def habit_completion_rate(user, period:)
    time_range =
      case period
      when :daily then Time.zone.today.all_day
      when :weekly then Time.zone.today.beginning_of_week..Time.zone.today.end_of_week
      end

    total_timeblocks = TimeBlock.joins(:habit).where(habits: { user_id: user.id }, start_time: time_range).count
    completed_timeblocks = TimeBlock.joins(:habit).where(habits: { user_id: user.id }, start_time: time_range, completed: true).count

    total_timeblocks.positive? ? (completed_timeblocks.to_f / total_timeblocks * 100).round(2) : 0
  end
end
