class HabitsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :show, :edit, :update, :destroy]
  before_action :authenticate_user!  # 需要登录
  before_action :set_habit, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category_id]
      @habits = Habit.joins(:categories).where(categories: { id: params[:category_id] }, user_id: session[:user_id])
    else
      @habits = Habit.where(user_id: session[:user_id])
    end
  end

  def show
    @time_blocks = @habit.time_blocks.order(start_time: :desc)
  end

  def new
    @habit = current_user.habits.new
    @categories = Category.all  # 供表单选择分类
  end

  def create
    @habit = current_user.habits.new(habit_params)
    if @habit.save
      @habit.categories << Category.where(id: params[:habit][:category_ids])
      redirect_to @habit, notice: '习惯创建成功！'
    else
      @categories = Category.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @habit.update(habit_params)
      @habit.categories = Category.where(id: params[:habit][:category_ids])
      redirect_to @habit, notice: '习惯更新成功！'
    else
      @categories = Category.all
      render :edit
    end
  end

  def destroy
     @habit.destroy
    redirect_to habits_path, notice: '习惯已删除'
  end

  private

  def set_habit
    @habit = current_user.habits.find(params[:id])
  end

  def habit_params
    params.require(:habit).permit(:name, :description, category_ids: [])
  end
end
