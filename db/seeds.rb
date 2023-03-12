# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Destroy all
Article.destroy_all
User.destroy_all

# Users create
5.times do |i|
  name = Faker::Name.first_name
  password = Faker::Internet.password(min_length: 6, max_length: 10)
  User.create(
      email:"#{name}@yopmail.com",
      password:password,
      password_confirmation:password
  )
  puts "*"*(i+1)
  puts "#{i+1} user(s) created"
end


# Articles create
15.times do |i|
  Article.create(
      title:Faker::Sports::Basketball.team,
      body:Faker::Lorem.paragraphs(number: 2),
      user_id:User.all.sample.id
  )
  puts "*"*(i+1)
  puts "#{i+1} article(s) created"
end
