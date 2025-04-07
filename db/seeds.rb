require 'faker'

puts "Cleaning up database..."
# 清空旧数据（开发环境下）
# 清空顺序很重要：从依赖表到主表
TimeBlock.destroy_all
Reminder.destroy_all
Habit.destroy_all
Follow.destroy_all # 自连接表，必须清除！
Category.destroy_all
User.destroy_all
puts "✅ Done."

# 创建用户并附加头像
puts "Creating users..."
5.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: "password",
    role: "user"
  )

  # 附加头像（你可以用默认图片）
  user.avatar.attach(
    io: File.open(Rails.root.join("app/assets/images/default_avatar.png")),
    filename: "default_avatar.png",
    content_type: "image/png"
  )
end

# 创建分类
puts "Creating categories..."
categories = []
%w[Health Productivity Learning Relaxation].each do |name|
  categories << Category.create!(name: name)
end

# 创建习惯、提醒和时间段
puts "Creating habits, reminders, and time blocks..."
User.all.each do |user|
  3.times do
    habit = Habit.create!(
      name: Faker::Verb.base.titleize,
      description: Faker::Lorem.sentence,
      user: user,
      categories: categories.sample(2)
    )

    Reminder.create!(
      habit: habit,
      reminder_time: Time.now + rand(1..12).hours
    )

    TimeBlock.create!(
      habit: habit,
      start_time: Time.now,
      end_time: Time.now + 30.minutes,
      completed: [true, false].sample,
      reason: Faker::Lorem.word
    )
  end
end

puts "✅ Seed completed."
