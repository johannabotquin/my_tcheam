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

mairie = Task.create!(
  name: "Rdv Mairie CNI",
  description: "Apporter le dossier pour la nouvelle CNI de Zoé à 14h30",
  category: "Fais tes papiers avant que ce soit le oaï !",
  reccurence: false,
  points: 20,
  deadline: "2024-06-27",
  achieved: false,
  priority: 2,
  user: user1,
  team: team
)
TaskManager.create!(user: user1, task: mairie)

tri = Task.create!(
  name: "Faire le tri dans les vêtements",
  description: "Organiser les sacs de tri pour en faire don",
  category: "La maison elle va pas se gérer seule, figure de poulpe !",
  reccurence: false,
  points: 30,
  deadline: "2024-06-29",
  achieved: false,
  priority: 1,
  user: user1,
  team: team
)
TaskManager.create!(user: user1, task: tri)

courses = Task.create!(
  name: "Faire les courses",
  description: "",
  category: "La maison elle va pas se gérer seule, figure de poulpe !",
  reccurence: true,
  points: 20,
  deadline: "2024-06-29",
  achieved: false,
  priority: 1,
  user: user1,
  team: team
)
TaskManager.create!(user: user1, task: courses)

repassage = Task.create!(
  name: "Repasser les habits de la semaine",
  description: "",
  category: "La maison elle va pas se gérer seule, figure de poulpe !",
  reccurence: true,
  points: 25,
  deadline: "2024-06-30",
  achieved: false,
  priority: 2,
  user: user1,
  team: team
)
TaskManager.create!(user: user1, task: repassage)

gateau = Task.create!(
  name: "Gateau Lola",
  description: "Acheter un gateau pour l'anniversaire de Lola.",
  category: "La maison elle va pas se gérer seule, figure de poulpe !",
  reccurence: false,
  points: 10,
  deadline: "2024-06-27",
  achieved: true,
  priority: 1,
  user: user2,
  team: team
)
TaskManager.create!(user: user2, task: gateau)

factures = Task.create!(
  name: "Payer les factures de services publics",
  description: "Payer les factures d'électricité, d'eau et d'internet pour le mois.",
  category: "Fais tes papiers avant que ce soit le oaï !",
  reccurence: true,
  points: 15,
  deadline: "2024-06-28",
  achieved: false,
  priority: 2,
  user: user3,
  team: team
)
TaskManager.create!(user: user3, task: factures)

maison = Task.create!(
  name: "Nettoyer les sols de la maison",
  description: "",
  category: "La maison elle va pas se gérer seule, figure de poulpe !",
  reccurence: true,
  points: 15,
  deadline: "2024-06-30",
  achieved: false,
  priority: 2,
  user: user4,
  team: team
)
TaskManager.create!(user: user4, task: maison)

ophtalmo = Task.create!(
  name: "Aller chez l'ophtalmo",
  description: "Rdv à 9h30",
  category: "Tu crains dégun mais tu dois en prendre soin...",
  reccurence: false,
  points: 20,
  deadline: "2024-06-28",
  achieved: true,
  priority: 2,
  user: user4,
  team: team
)
TaskManager.create!(user: user4, task: ophtalmo)

vitres = Task.create!(
  name: "Nettoyer les vitres",
  description: "",
  category: "La maison elle va pas se gérer seule, figure de poulpe !",
  reccurence: true,
  points: 15,
  deadline: "2024-06-29",
  achieved: false,
  priority: 2,
  user: user1,
  team: team
)
TaskManager.create!(user: user1, task: vitres)

poussières = Task.create!(
  name: "Faire les poussières",
  description: "",
  category: "La maison elle va pas se gérer seule, figure de poulpe !",
  reccurence: true,
  points: 15,
  deadline: "2024-06-30",
  achieved: false,
  priority: 2,
  user: user1,
  team: team
)
TaskManager.create!(user: user1, task: poussières)

machines = Task.create!(
  name: "Faire les machines de linge",
  description: "",
  category: "La maison elle va pas se gérer seule, figure de poulpe !",
  reccurence: true,
  points: 25,
  deadline: "2024-06-28",
  achieved: false,
  priority: 2,
  user: user1,
  team: team
)
TaskManager.create!(user: user1, task: machines)

draps = Task.create!(
  name: "Changer les draps des lits",
  description: "",
  category: "La maison elle va pas se gérer seule, figure de poulpe !",
  reccurence: true,
  points: 15,
  deadline: "2024-06-30",
  achieved: false,
  priority: 2,
  user: user1,
  team: team
)
TaskManager.create!(user: user1, task: draps)

papiers = Task.create!(
  name: "Trier les papiers",
  description: "",
  category: "Fais tes papiers avant que ce soit le oaï !",
  reccurence: true,
  points: 15,
  deadline: "2024-06-28",
  achieved: false,
  priority: 2,
  user: user3,
  team: team
)
TaskManager.create!(user: user3, task: papiers)

planning = Task.create!(
  name: "Faire le planning des repas de la semaine",
  description: "",
  category: "Fais tes papiers avant que ce soit le oaï !",
  reccurence: true,
  points: 15,
  deadline: "2024-06-29",
  achieved: false,
  priority: 2,
  user: user3,
  team: team
)
TaskManager.create!(user: user3, task: planning)

puts "Tasks created."

puts "Creating rewards..."

Reward.create!(
  name: "Week-end familial à la campagne",
  goal: 150,
  user_id: user1.id,
  team_id: team.id,
  selected: true
)

Reward.create!(
  name: "Plateau télé et cheat meal en famille",
  goal: 50,
  user_id: user2.id,
  team_id: team.id,
  selected: false
)

Reward.create(
  name: "Séjour à DisneyLand Paris",
  goal: 1000,
  team_id: team.id,
  user_id: User.first.id,
  selected: false
)

Reward.create(
  name: "Week-end au Parc Asterix",
  goal: 500,
  team_id: team.id,
  user_id: User.first.id,
  selected: false
)

puts "Rewards created"

puts "creating lists..."

liste_repas_semaine = List.create(
  name: "Courses",
  content: "Pizza, Pâtes au pesto, Saumon en papillote",
  user: user1
)

cadeau_lola = List.create!(
  name: "Cadeau d'anniversaire Lola",
  content: "Robe, collier, livre",
  user_id: user1.id
)

cadeau_papa = List.create!(
  name: "Cadeau d'anniversaire Papa",
  content: "Fleurs, chocolats, carte",
  user: user1
)

ListManager.create!(user: user1, list: liste_repas_semaine)
ListManager.create!(user: user2, list: liste_repas_semaine)
ListManager.create!(user: user3, list: liste_repas_semaine)
ListManager.create!(user: user4, list: liste_repas_semaine)
ListManager.create!(user: user1, list: cadeau_lola)
ListManager.create!(user: user2, list: cadeau_papa)


Memorie.create!(
  name: "Voyage à Paris",
  content: "Un voyage incroyable à Paris, visites à la Tour Eiffel et au Louvre.",
  date: "2023-05-21",
  photo: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/4b/59/86/caption.jpg?w=1400&h=1400&s=1",
  team_id: team.id
)

Memorie.create!(
  name: "Séjour en espagne",
  content: "Séjour fabuleux à Alicante, journées plage et visite chateau de Santa Barbara.",
  date: "2023-08-12",
  photo: "https://www.servigroup.com/assets/cache/uploads/gallery/proposals/excursiones/que-ver-alicante/1200x674/explanada-paseo-alicante.webp?from=jpg" "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/4b/59/86/caption.jpg?w=1400&h=1400&s=1",
  team_id: team.id
)

Memorie.create!(
  name: "Soirée Karaoké",
  content: "Soirér karaoké au Populo, ambiance de folie.",
  date: "2023-10-10",
  photo: "https://img.20mn.fr/DtlNkbTkTwyBGvHyDltbJg/1444x920_clients-poussent-chansonnette-bam-karaoke-box-paris",
  team_id: team.id
)

Memorie.create!(
  name: "Voyage en chine",
  content: "Découverte de la Chine, visite de la Grande Muraille et de la Cité Interdite.",
  date: "2024-02-24",
  photo: "https://images.ctfassets.net/rc3dlxapnu6k/4lie0LcrcmBgXd1DTs3BD8/ad8ccf24bff67369c5b9c5e8e8ac67d5/iStock-598959570.jpg?w=1923&h=1082&fl=progressive&q=50&fm=jpg",
  team_id: team.id
)

puts "Lists created."

puts "creating chatrooms..."

Chatroom.create(name: "Ma tcheam")

ChatroomUser.create(chatroom: Chatroom.first, user: user1)
ChatroomUser.create(chatroom: Chatroom.first, user: user2)
ChatroomUser.create(chatroom: Chatroom.first, user: user3)
ChatroomUser.create(chatroom: Chatroom.first, user: user4)

puts "Chatrooms created."

puts "Seed data successfully created."
