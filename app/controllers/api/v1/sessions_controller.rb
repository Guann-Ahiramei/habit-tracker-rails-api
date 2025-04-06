class Api::V1::SessionsController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  
  def create
    # user = User.find_by(email: params[:email])
    # if user&.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   redirect_to dashboard_path, notice: 'Sign in successfully'
    # else
    #   flash[:alert] = 'Incorrect e-mail or password'
    #   render :new
    # end

    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      puts "User logged in: #{user.id}"  # 这里打印一下 user_id
      render json: { message: 'Logged in successfully', user: user }, status: :ok
    else
      render json: { error: 'Incorrect email or password' }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { message: 'Logged out' }, status: :ok
  end
end
