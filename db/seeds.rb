# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear data
Memorie.destroy_all
Reward.destroy_all
TaskManager.destroy_all
Task.destroy_all
List.destroy_all
User.destroy_all
Team.destroy_all

puts "Creating teams..."
team = Team.create!(
  name: "The Avengers",
  score: 0
)
puts "Teams created."

puts "Creating users..."
user1 = User.create!(
  first_name: "Johanna",
  last_name: "Botquin",
  pseudo: "Jojo",
  email: "johanna@gmail.com",
  password: "angryjojo",
  avatar: "https://pictory.ai/wp-content/uploads/2022/03/pictory_500.png",
  team_id: team.id
)

user2 = User.create!(
  first_name: "Ragheed",
  last_name: "Sleimani",
  pseudo: "Rara",
  email: "ragheed.sleimani@gmail.com",
  password: "zenragheed",
  avatar: "https://pictory.ai/wp-content/uploads/2022/03/pictory_500.png",
  team_id: team.id
)
puts "Users created."

puts "Creating tasks..."
begin
  ActiveRecord::Base.transaction do
    project = Task.create!(
      name: "Compléter le rapport de projet",
      description: "Terminer le rapport final pour le soumettre à Laura.",
      category: "Fais tes papiers avant que ce soit le oaï !",
      reccurence: false,
      points: 50,
      deadline: "2024-06-19",
      achieved: false,
      priority_tag: 1,
      user: user1
    )
    TaskManager.create!(user: user1, task: project)

    courses = Task.create!(
      name: "Faire les courses",
      description: "Acheter les provisions pour la semaine, y compris les fruits, légumes et produits laitiers.",
      category: "La maison elle va pas se gérer seule, figure de poulpe !",
      reccurence: true,
      points: 10,
      deadline: "2024-06-19",
      achieved: false,
      priority_tag: 2,
      user: user1
    )
    TaskManager.create!(user: user1, task: courses)

    medecin = Task.create!(
      name: "Rendez-vous chez le médecin",
      description: "Bilan annuel avec le Dr. Zac à la clinique.",
      category: "Tu crains dégun mais tu dois en prendre soin",
      reccurence: false,
      points: 30,
      deadline: "2024-06-20",
      achieved: false,
      priority_tag: 1,
      user: user1
    )
    TaskManager.create!(user: user1, task: medecin)

    factures = Task.create!(
      name: "Payer les factures de services publics",
      description: "Payer les factures d'électricité, d'eau et d'internet pour le mois.",
      category: "Fais tes papiers avant que ce soit le oaï !",
      reccurence: true,
      points: 15,
      deadline: "2024-06-20",
      achieved: false,
      priority_tag: 2,
      user: user1
    )
    TaskManager.create!(user: user1, task: factures)

    carte = Task.create!(
      name: "Renouveller la carte d'identité",
      description: "",
      category: "Fais tes papiers avant que ce soit le oaï !",
      reccurence: false,
      points: 25,
      deadline: "2024-06-21",
      achieved: false,
      priority_tag: 2,
      user: user1
    )
    TaskManager.create!(user: user1, task: carte)

    puts "Tasks created."
  end
rescue ActiveRecord::RecordInvalid => e
  puts "Error creating tasks: #{e.message}"
  raise ActiveRecord::Rollback
end

puts "Creating lists..."
List.create!(
  name: "Courses",
  content: "Fruits, légumes, produits laitiers",
  user_id: user1.id
)

List.create!(
  name: "Cadeau d'anniversaire Maman",
  content: "Fleurs, chocolats, carte",
  user_id: user1.id
)
puts "Lists created."

puts "Creating rewards..."
Reward.create!(
  name: "Week-end à la campagne",
  goal: 100,
  user_id: user1.id,
  team_id: team.id
)

Reward.create!(
  name: "Dîner romantique",
  goal: 50,
  user_id: user2.id,
  team_id: team.id
)
puts "Rewards created."

puts "Seed data successfully created."
