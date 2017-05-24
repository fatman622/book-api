# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
book_list = [
  [ "Oleg", "My Text", true, 23],
  [ "Oleg", "My Te2", true, 23],
  [ "Oleg", "My Te2", false, 23]
]

book_content_list = []

user_list = [
  ["olegbabiy.ob@gmail.com","123456789","123456789"]
]


100.times do
  author = Faker::Name.first_name
  text = Faker::Name.last_name
  available = rand(2) == 1 ? true : false
  pages = Faker::Number.between(1,4)
  book_list << [ author, text, available, pages]
end

5.times do
  text = Faker::Name.last_name
  book_content_list << [ text ]
end

book_list.each do |author, text, available, pages|
  Book.create(author: author, text: text, available: available,  pages: pages)
end

book_content_list.each do |text|
  BookContent.create(text: text) 
end

user_list.each do |email, password, password_confirmation|
  User.create(email: email, password: password, password_confirmation: password_confirmation) 
end