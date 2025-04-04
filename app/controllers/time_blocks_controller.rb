class TimeBlocksController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:create, :start, :finish, :update]
  # before_action :authenticate_user!
  # skip_before_action :verify_authenticity_token, only: [:start, :finish,:create, :start, :update,:set_time_block]
  before_action :set_habit
  before_action :set_time_block, only: [:edit, :update, :start, :finish]

  # 开始一个时间块
  def start
    @time_block.update(start_time: Time.now)
    redirect_to habit_time_blocks_path(@habit), notice: 'Time block started.'
  end

  # 结束一个时间块并记录状态
  def finish
    @time_block.update(end_time: Time.now, completed: true)
    redirect_to habit_time_blocks_path(@habit), notice: 'Time block completed.'
  end

  def new
    @time_block = @habit.time_blocks.new
  end

  def index
    @time_blocks = @habit.time_blocks
  end

  def create
    @time_block = @habit.time_blocks.new(time_block_params)
    if @time_block.save
      redirect_to habit_path(@habit), notice: 'Time block created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @time_block.update(time_block_params)
      redirect_to habit_time_blocks_path(@habit), notice: 'Time block updated successfully.'
    else
      render :edit
    end
  end


  private

  def set_habit
    @habit = Habit.find(params[:habit_id])
  end

  def set_time_block
    @time_block = @habit.time_blocks.find(params[:id])
  end

  def time_block_params
    params.require(:time_block).permit(:start_time, :end_time, :reason, :completed)
  end
end
