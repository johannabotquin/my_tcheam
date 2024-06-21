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

  name: "Mon olympique",
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
      priority: 1,
      user: user2
    )
    TaskManager.create!(user: user2, task: project)

    courses = Task.create!(
      name: "Faire les courses",
      description: "Acheter les provisions pour la semaine, y compris les fruits, légumes et produits laitiers.",
      category: "La maison elle va pas se gérer seule, figure de poulpe !",
      reccurence: true,
      points: 10,
      deadline: "2024-06-19",
      achieved: true,
      priority: 2,
      user: user2
    )
    TaskManager.create!(user: user2, task: courses)

    medecin = Task.create!(
      name: "Rendez-vous chez le médecin",
      description: "Bilan annuel avec le Dr. Zac à la clinique.",
      category: "Tu crains dégun mais tu dois en prendre soin...",
      reccurence: false,
      points: 30,
      deadline: "2024-06-20",
      achieved: true,
      priority: 1,
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
      priority: 2,
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
      priority: 2,
      user: user1
    )
    TaskManager.create!(user: user1, task: carte)

    demoday = Task.create!(
      name: "Finir projet demoday",
      description: "",
      category: "Fais tes papiers avant que ce soit le oaï !",
      reccurence: false,
      points: 25,
      deadline: "2024-06-23",
      achieved: true,
      priority: 2,
      user: user1
    )
    TaskManager.create!(user: user1, task: demoday)

    seed = Task.create!(
      name: "Faire les seeds",
      description: "",
      category: "Fais tes papiers avant que ce soit le oaï !",
      reccurence: false,
      points: 25,
      deadline: "2024-06-24",
      achieved: false,
      priority: 2,
      user: user2
    )
    TaskManager.create!(user: user2, task: seed)

    puts "Tasks created."
  end
rescue ActiveRecord::RecordInvalid => e
  puts "Error creating tasks: #{e.message}"
  raise ActiveRecord::Rollback
end

puts "Creating rewards..."

Reward.create!(
  name: "Week-end à la campagne",
  goal: 100,
  user_id: user1.id,
  team_id: team.id,
  selected: true
)

Reward.create!(
  name: "Dîner romantique",
  goal: 50,
  user_id: user2.id,
  team_id: team.id,
  selected: false
)

Reward.create(
  name: "voyage a disney land",
  goal: 100,
  team_id: team.id,
  user_id: User.first.id,
  selected: false
)

Reward.create(
  name: "voyage au parc Asterix",
  goal: 80,
  team_id: team.id,
  user_id: User.first.id,
  selected: false
)

puts "Rewards created"

puts "creating lists..."

List.create(
  name: "Courses",
  content: "Fruits, légumes, produits laitiers",
  user_id: user1.id
)

List.create!(
  name: "Cadeau d'anniversaire Maman",
  content: "Fleurs, chocolats, carte",
  user_id: user1.id
)

Memorie.create!(
  name: "Voyage à Paris",
  content: "Un voyage incroyable à Paris, avec des visites à la Tour Eiffel et au Louvre.",
  date: "2023-05-21",
  photo: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/4b/59/86/caption.jpg?w=1400&h=1400&s=1",
  team_id: team.id
)

Memorie.create!(
  name: "Voyage en espagne",
  content: "Un voyage magnifique",
  date: "2023-08-10",
  photo: "https://www.servigroup.com/assets/cache/uploads/gallery/proposals/excursiones/que-ver-alicante/1200x674/explanada-paseo-alicante.webp?from=jpg" "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/4b/59/86/caption.jpg?w=1400&h=1400&s=1",
  team_id: team.id
)

Memorie.create!(
  name: "soirée karaoké",
  content: "Dans un bar tres select",
  date: "2023-08-10",
  photo: "https://img.20mn.fr/DtlNkbTkTwyBGvHyDltbJg/1444x920_clients-poussent-chansonnette-bam-karaoke-box-paris",
  team_id: team.id
)

Memorie.create!(
  name: "voyage en chine",
  content: "un pays d'asie",
  date: "2023-08-10",
  photo: "https://images.ctfassets.net/rc3dlxapnu6k/4lie0LcrcmBgXd1DTs3BD8/ad8ccf24bff67369c5b9c5e8e8ac67d5/iStock-598959570.jpg?w=1923&h=1082&fl=progressive&q=50&fm=jpg",
  team_id: team.id
)

puts "Lists created."

puts "Seed data successfully created."
