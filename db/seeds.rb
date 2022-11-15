require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
puts 'Destroying Users'
Pet.destroy_all
puts 'Destroying Pets 😭'
Booking.destroy_all
puts 'Destroying Bookings'

puts 'Seeding Database'
puts 'Creating Users'

50.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 8),
    rating: (1..5).to_a.sample,
  )
end

puts 'Creating Pets'
50.times do
  Pet.create!(
    price: (100..100_000_000).to_a.sample,
    name: Faker::Name.unique.name,
    description: Faker::Creature::Animal.name,
    available: [true, false].sample,
    image: 'http://source.unsplash.com/featured/?<%= @restaurant.category.downcase %>&<%= rand(1000) %>/800x333'
  )
end

puts 'Creating bookings'

50.times do
  Booking.create!(
    date_start: Faker::Date.between(from: '2022-01-1', to: '2022-06-31'),
    date_end: Faker::Date.between(from: '2022-07-1', to: '2022-12-31'),
    status: ['Accepted', 'Pending', 'Rejected'].sample
  )
end

puts "Created #{USer.count} users, #{Pet.count} pets, and #{Booking.count} bookings"
