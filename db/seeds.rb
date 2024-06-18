# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Task.destroy_all
User.destroy_all
Team.destroy_all
List.destroy_all
Reward.destroy_all

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

puts "creating tasks..."

Task.create(
  name: "Compléter le rapport de projet",
  description: "Terminer le rapport final pour le soumettre à Laura.",
  category: "Fais tes papiers avant que ce soit le oaï !",
  reccurence: false,
  points: 50,
  deadline: "2024-07-01",
  achieved: false,
  priority_tag: 1,
  user_id: User.first.id
)

Task.create(
    name: "Faire les courses",
    description: "Acheter les provisions pour la semaine, y compris les fruits, légumes et produits laitiers.",
    category: "La maison elle va pas se gérer seule, figure de poulpe !",
    reccurence: true,
    points: 10,
    deadline: "2024-06-20",
    achieved: false,
    priority_tag: 2,
    user_id:  User.first.id
)

Task.create(
  name: "Rendez-vous chez le médecin",
  description: "Bilan annuel avec le Dr. Zac à la clinique.",
  category: "Tu crains dégun mais tu dois en prendre soin",
  reccurence: false,
  points: 30,
  deadline: "2024-06-25",
  achieved: false,
  priority_tag: 1,
  user_id: User.first.id
)

Task.create(
  name: "Payer les factures de services publics",
  description: "Payer les factures d'électricité, d'eau et d'internet pour le mois.",
  category: "Fais tes papiers avant que ce soit le oaï !",
  reccurence: true,
  points: 15,
  deadline: "2024-06-28",
  achieved: false,
  priority_tag: 2,
  user_id: User.last.id
)

Task.create(
  name: "Renouveller la carte d'identité",
  description: "",
  category: "Fais tes papiers avant que ce soit le oaï !",
  reccurence: false,
  points: 25,
  deadline: "2024-06-27",
  achieved: false,
  priority_tag: 2,
  user_id: User.first.id
)

Reward.create(
  name: "voyage a disney land",
  goal: "100",
  team_id: team.id,
  user_id: User.first.id
)

Reward.create(
  name: "voyage au parc Asterix",
  goal: "80",
  team_id: team.id,
  user_id: User.first.id
)

puts "end tasks"

puts "creating lists..."

List.create(
  name: "Courses",
  content: "Fruits, légumes, produits laitiers",
  user_id: User.first.id
)

List.create(
  name: "Cadeau d'anniversaire Maman",
  content: "Fleurs, chocolats, carte",
  user_id: User.first.id
)

puts "end lists"
