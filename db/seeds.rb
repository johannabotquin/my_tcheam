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
  first_name: "Laura",
  last_name: "Cabos",
  pseudo: "Lolo",
  email: "laura@gmail.com",
  password: "angrylolo",
  avatar: "avatar-mama.svg",
  team_id: team.id
)

user2 = User.create!(
  first_name: "Emerick",
  last_name: "Cabos",
  pseudo: "Rickou",
  email: "Emerick@gmail.com",
  password: "zenemerick",
  avatar: "avatar-papa.svg",
  team_id: team.id
)

user3 = User.create!(
  first_name: "Lola",
  last_name: "Cabos",
  pseudo: "Lolita",
  email: "lola@gmail.com",
  password: "lolaboss",
  avatar: "avatar-enfant2.svg",
  team_id: team.id
)

user4 = User.create!(
  first_name: "Zoé",
  last_name: "Cabos",
  pseudo: "Zozo",
  email: "zoé@gmail.com",
  password: "zoelagirafe",
  avatar: "avatar-enfant1.svg",
  team_id: team.id
)
puts "Users created."

puts "Creating tasks..."

demoday = Task.create!(
  name: "demoday 1",
  description: "Préparer la présentation pour le demoday",
  category: "Fais tes papiers avant que ce soit le oaï !",
  reccurence: false,
  points: 20,
  deadline: "2024-06-21",
  achieved: true,
  priority: 2,
  user: user1
)
TaskManager.create!(user: user1, task: demoday)

courses = Task.create!(
  name: "Faire les courses",
  description: "",
  category: "La maison elle va pas se gérer seule, figure de poulpe !",
  reccurence: false,
  points: 20,
  deadline: "2024-06-21",
  achieved: false,
  priority: 1,
  user: user1
)
TaskManager.create!(user: user1, task: courses)

passeport = Task.create!(
  name: "Renouveler le passeport",
  description: "Rdv à la mairie à 15h30.",
  category: "Fais tes papiers avant que ce soit le oaï !",
  reccurence: false,
  points: 10,
  deadline: "2024-06-21",
  achieved: true,
  priority: 2,
  user: user1
)
TaskManager.create!(user: user1, task: passeport)

gateau = Task.create!(
  name: "Gateau Lola",
  description: "Acheter un gateau pour l'anniversaire de Lola.",
  category: "La maison elle va pas se gérer seule, figure de poulpe !",
  reccurence: false,
  points: 10,
  deadline: "2024-06-22",
  achieved: false,
  priority: 1,
  user: user1
)
TaskManager.create!(user: user1, task: gateau)

factures = Task.create!(
  name: "Payer les factures de services publics",
  description: "Payer les factures d'électricité, d'eau et d'internet pour le mois.",
  category: "Fais tes papiers avant que ce soit le oaï !",
  reccurence: true,
  points: 15,
  deadline: "2024-06-22",
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
  points: 15,
  deadline: "2024-06-21",
  achieved: false,
  priority: 2,
  user: user2
)
TaskManager.create!(user: user2, task: carte)

ophtalmo = Task.create!(
  name: "Aller chez l'ophtalmo",
  description: "Rdv à 9h30",
  category: "Tu crains dégun mais tu dois en prendre soin...",
  reccurence: false,
  points: 20,
  deadline: "2024-06-20",
  achieved: true,
  priority: 2,
  user: user1
)
TaskManager.create!(user: user1, task: ophtalmo)

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

puts "Creating rewards..."

Reward.create!(
  name: "Week-end à la campagne",
  goal: 100,
  user_id: user1.id,
  team_id: team.id,
  selected: true
)

Reward.create!(
  name: "Dîner en famille",
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
