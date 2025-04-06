class Api::V1::TimeBlocksController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:start, :finish,:create, :start, :update,:set_time_block]
  before_action :set_habit
  before_action :set_time_block, only: [:update, :start, :finish]

  def index
    @time_blocks = @habit.time_blocks
    render json: @time_blocks
  end

  def create
    @time_block = @habit.time_blocks.new(time_block_params)
    if @time_block.save
      render json: @time_block, status: :created
    else
      render json: { errors: @time_block.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @time_block.update(time_block_params)
      render json: @time_block
    else
      render json: { errors: @time_block.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def start
    if @time_block.update(start_time: Time.now)
      render json: @time_block
    else
      render json: { errors: @time_block.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def finish
    if @time_block.update(end_time: Time.now, completed: true)
      render json: @time_block
    else
      render json: { errors: @time_block.errors.full_messages }, status: :unprocessable_entity
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
