require 'faker'
require "open-uri"
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

25.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 8),
    username: Faker::Internet.unique.username
  )
end

animals = %w[dog cat snake bird fish turtle corgi bear tiger lion rabbit hamster giraffe pig]
puts 'Creating Pets'
25.times do
  species = animals.sample
  pet = Pet.create!(
    price: rand(1..100),
    name: Faker::Name.unique.name,
    species: species,
    description: "They're a good #{species}",
    available: [true, false].sample,
    user: User.all.sample
  )
  puts "Searching for an image for a #{species}"
  file = URI.open("http://source.unsplash.com/featured/?#{species}")
  pet.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  pet.save
end

puts 'Creating bookings'

25.times do
  date_start = rand(1..50)
  date_end = rand(51..100)
  Booking.create!(
    date_start: Faker::Date.forward(days: date_start),
    date_end: Faker::Date.forward(days: date_end),
    status: [0, 1, 2].sample,
    user: User.all.sample,
    pet: Pet.all.sample
  )
end

puts "Created #{User.count} users, #{Pet.count} pets, and #{Booking.count} bookings"
