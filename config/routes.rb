Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        member do
          post 'follow'
          post 'unfollow'
        end
      end

      resources :sessions, only: [:create, :destroy]

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
