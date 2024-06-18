# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Team.destroy_all
User.destroy_all

puts "creating teams..."

team = Team.create(
  name: "The Avengers",
  score: 0
)
puts "end teams"
puts "creating users..."

User.create(
  first_name: "Johanna",
  last_name: "Botquin",
  pseudo: "Jojo",
  email: "johanna@gmail.com",
  password: "angryjojo",
  avatar: "https://pictory.ai/wp-content/uploads/2022/03/pictory_500.png",
  team_id: team.id
)

User.create(
  first_name: "Ragheed",
  last_name: "Sleimani",
  pseudo: "Rara",
  email: "ragheed.sleimani@gmail.com",
  password: "zenragheed",
  avatar: "https://pictory.ai/wp-content/uploads/2022/03/pictory_500.png",
  team_id: team.id
)

puts "end users"
