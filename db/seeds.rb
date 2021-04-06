# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |n|
  User.create!(email: "user_#{n}@placesharing.com", username: "user_#{n}", password: "qwertyuio", password_confirmation: "qwertyuio")
end

  puts "User created: #{User.count}"


  first_user = User.first

  first_user.places.create!(name: "Candi Borobudur", lat: -7.607810, lon: 110.203762)
  first_user.places.create!(name: "Candi Gatotkaca", lat: -7.208641, lon: 109.905962, public_status: true)
  first_user.places.create!(name: "Candi Prambanan", lat: -7.75345, lon: 110.49411, public_status: true)

  second_user = User.second
  second_user.places.create!(name: "Candi Dwarawati", lat: -7.197528, lon: 109.910843)
  second_user.places.create!(name: "Bima Temple", lat: -7.214271, lon: 109.910532, public_status: true)
  second_user.places.create!(name: "Candi Gedong Songo", lat: -7.20554, lon: 110.35480, public_status: true)

  puts "Place created: #{Place.count}"

  third_user = User.third
  fourth_user = User.fourth
  fifth_user = User.fifth

  first_place = Place.first
  second_place = Place.second
  fourth_place = Place.fourth
  fifth_place = Place.fifth

  i = 1

  first_place_permissions = first_user.place_permissions.first
  second_place_permissions = first_user.place_permissions.second
  fourth_place_permissions = second_user.place_permissions.first
  fifth_place_permissions = second_user.place_permissions.second

  first_array_user_id = Array.new

  until i == 4 do
    i += 1
    first_array_user_id.push(i)
  end

  first_place_permissions.update(share_with: first_array_user_id)
  second_place_permissions.update(share_with: first_array_user_id)

  puts "Users: #{first_user.username} share #{first_user.place_permissions.size} places"

  second_array_user_id = Array.new

  i = 5

  until i == 9 do
    second_array_user_id.push(i)
    i += 1
  end

  fourth_place_permissions.update(share_with: second_array_user_id)
  fifth_place_permissions.update(share_with: second_array_user_id)

  puts "Users: #{second_user.username} share #{second_user.place_permissions.size} places"
