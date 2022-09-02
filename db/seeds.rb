# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user_ids = []
3.times do
  user = User.create(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.birthday,
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: 'WfN6uYm4EyW5mXm',
    password_confirmation: 'WfN6uYm4EyW5mXm')

  3.times do
    Mission.create(title: Faker::Job.title, details: Faker::Lorem.paragraph, price: Faker::Commerce.price, user_id: user.id)
  end
  user_ids << user.id
end

Mission.all.each do |mission|
  user_ids.delete(mission.user_id)
  user_ids.each do |id|
    Bid.create(message: Faker::Lorem.paragraph, price: Faker::Commerce.price, user_id: id, mission_id: mission.id)
  end
end
