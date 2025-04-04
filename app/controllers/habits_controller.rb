class HabitsController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:create, :show, :edit, :update, :destroy]
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
    @category = Category.find(params[:category_id]) # 获取当前类别
    @habit = @category.habits.new                  # 基于类别创建习惯
    @habits = @category.habits                     # 获取该类别下的所有习惯
  end

  def create
    puts "Params: #{params.inspect}" 
    @category = Category.find(params[:category_id]) # 获取当前类别
    @habit = Habit.new(habit_params)                # 直接新建习惯
    @habit.user = current_user                      # 设置用户
  
    if @habit.save
      @habit.categories << @category                # 手动建立关联
      redirect_to new_category_habit_path(@category), notice: 'Habit created successfully!'
    else
      @habits = @category.habits
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
