class ApplicationController < ActionController::API
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user!
    unless current_user
      render json: { error: "Unauthorized. Please log in." }, status: :unauthorized
    end
  end
end
