# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# # 清空数据（仅开发环境）
# User.destroy_all
# Category.destroy_all
# Habit.destroy_all

# 创建用户
User.create!(email: "admin@example.com", password: "password", role: "admin")
User.create!(email: "user2@example.com", password: "password", role: "user")

# 创建分类
categories = {
  "Health" => ["Running", "Dumb bell", "Walking"],
  "Learning" => ["Reading", "Coding practice"],
  "Communication" => ["Call family", "Meet new people"]
}

user = User.last

categories.each do |category_name, habit_names|
  category = Category.create!(name: category_name)
  
  habit_names.each do |habit_name|
    habit = Habit.create!(
      name: habit_name,
      description: "#{habit_name} activity",
      user: user
    )
    category.habits << habit
  end
end