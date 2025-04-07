class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
  helper_method :current_api_v1_user

  def authenticate_user!
    unless current_api_v1_user
      render json: { error: "Unauthorized. Please log in." }, status: :unauthorized
    end
  end
end
