# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 100.times do |index|
#   Review.create!(
#     name: "Обзор на кино ##{index}",
#     group: "Кино",
#     description: "Описание обзора на кино ##{index}",
#     author_rating: rand(10).round(1),
#     content: "Текст обзора ##{index}",
#     user_id: User.first&.id
#   )
# end

# 100.times do |index|
#   Review.create!(
#     name: "Обзор на книгу ##{index}",
#     group: "Книга",
#     description: "Описание обзора на книгу ##{index}",
#     author_rating: rand(3.0..10.0).round(2),
#     content: "Текст обзора ##{index}",
#     user_id: User.first&.id
#   )
# end

USER_ROLES = ['banned', 'user', 'admin']

USER_ROLES.each do |role|
  Role.find_or_create_by! name: role
end

User.all.each do |user| 
  user.roles.push Role.find_role(:user) unless user.role?(:user)
end

User.first&.roles.push Role.find_role(:admin) unless User.first&.role?(:admin)

CATEGORIES = ['Кино', 'IT', 'Книги', 'Недвижимость', 'СМИ', 'Автомобили']

CATEGORIES.each do |category|
  Category.find_or_create_by! name: category
end