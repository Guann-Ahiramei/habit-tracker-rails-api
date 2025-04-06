class Api::V1::UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:show, :index, :create, :follow, :unfollow]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { message: 'User created successfully', user: @user }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
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
    render json: {
      user: @user,
      friends_stats: @friends_stats,
      followed_users: @user.followed_users,
      followers: @user.followers
    }, status: :ok
  end

  def index
    if params[:search].present?
      @searched_user = User.where("email LIKE ?", "%#{params[:search]}%").where.not(id: current_user.id).first
    end
    @followers = current_user.followers
    @followed_users = current_user.followed_users
    @weekly_habit_stats = calculate_weekly_habit_stats(@followed_users)

    render json: {
      searched_user: @searched_user,
      followers: @followers,
      followed_users: @followed_users,
      weekly_habit_stats: @weekly_habit_stats
    }, status: :ok
  end

  def follow
    @user = User.find(params[:id])
    if @user == current_user
      render json: { error: "Can't follow yourself." }, status: :unprocessable_entity
      return
    end
    unless current_user.followed_users.include?(@user)
      if current_user.followed_users << @user
        render json: { message: "You are now following #{@user.email}" }, status: :ok
      else
        render json: { error: "Failed to follow #{@user.email}" }, status: :unprocessable_entity
      end
    else
      render json: { error: "You are already following #{@user.email}" }, status: :unprocessable_entity
    end
  end

  def unfollow
    @user = User.find(params[:id])
    if current_user.followed_users.delete(@user)
      render json: { message: "You have unfollowed #{@user.email}" }, status: :ok
    else
      render json: { error: "Failed to unfollow #{@user.email}" }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end

  def calculate_weekly_habit_stats(users)
    start_of_week = Time.current.beginning_of_week
    end_of_week = Time.current.end_of_week

    users.map do |user|
      completed_count = user.habits.joins(:time_blocks)
                              .where(time_blocks: { completed: true, start_time: start_of_week..end_of_week })
                              .count
      { user: user, completed_count: completed_count }
    end
  end

  def habit_completion_rate(user, period:)
    start_time = case period
                 when :daily
                   Time.current.beginning_of_day
                 when :weekly
                   Time.current.beginning_of_week
                 else
                   raise ArgumentError, "Invalid period: #{period}"
                 end

    completed_count = user.habits.joins(:time_blocks)
                                  .where(time_blocks: { completed: true, start_time: start_time..Time.current })
                                  .count

    total_count = user.habits.count

    return 0 if total_count.zero?

    (completed_count.to_f / total_count * 100).round(2)
  end

end
