Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # ✅ 认证接口路径调整为 /api/v1/auth
      mount_devise_token_auth_for 'User', at: 'auth'
      
      resources :users do
        member do
          post 'follow'
          post 'unfollow'
        end
      end

      resources :habits, except: [:new, :create] do
        resources :reminders, only: [:index, :create, :destroy]
        resources :time_blocks, only: [:index, :create, :update] do
          member do
            patch :start
            patch :finish
          end
        end
      end

      resources :categories, only: [:index] do
        resources :habits, only: [:create]
      end
    end
  end
end
