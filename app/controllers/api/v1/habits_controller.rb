class Api::V1::HabitsController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:create, :show, :edit, :update, :destroy]
  before_action :authenticate_user!  # 需要登录
  before_action :set_habit, only: [:show, :update, :destroy]

  def index
    if params[:category_id]
      @habits = Habit.joins(:categories).where(categories: { id: params[:category_id] }, user_id: session[:user_id])
    else
      @habits = Habit.where(user_id: session[:user_id])
    end
    render json: @habits, status: :ok
  end

  def show
    @time_blocks = @habit.time_blocks.order(start_time: :desc)
    render json: { habit: @habit, time_blocks: @time_blocks }, status: :ok
  end

  def create
    category = Category.find_by(id: params[:category_id])
    return render json: { error: 'Category not found' }, status: :not_found unless category

    habit = Habit.new(habit_params)
    habit.user = current_user

    if habit.save
      habit.categories << category
      render json: habit, status: :created
    else
      render json: { errors: habit.errors.full_messages }, status: :unprocessable_entity
    end
  end 

  def update
    if @habit.update(habit_params)
      if params[:habit][:category_ids]
        @habit.categories = Category.where(id: params[:habit][:category_ids])
      end
      render json: @habit, status: :ok
    else
      render json: { errors: @habit.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @habit.destroy
    render json: { message: 'Habit deleted successfully' }, status: :ok
  end

  private

  def set_habit
    @habit = current_user.habits.find(params[:id])
  end

  def habit_params
    params.require(:habit).permit(:name, :description, category_ids: [])
  end
end
