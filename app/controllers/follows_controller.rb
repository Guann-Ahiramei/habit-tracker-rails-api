class FollowsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create
    user_to_follow = User.find(params[:followed_id])
    # 防止用户自己关注自己
    if user_to_follow == current_user
      redirect_to users_path, alert: "不能关注自己"
      return
    end
    # 创建关注记录
    current_user.followed_users << user_to_follow unless current_user.followed_users.include?(user_to_follow)
    redirect_to users_path, notice: "已关注 #{user_to_follow.email}"
  end

  def destroy
    user_to_unfollow = User.find(params[:id])
    current_user.followed_users.delete(user_to_unfollow)
    redirect_to users_path, notice: "已取消关注 #{user_to_unfollow.email}"
  end
end
