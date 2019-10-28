# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# LES USERS
# Tu vas faire 10 utilisateurs en base avec Faker.

# LES VILLES
# Un utilisateur appartient à une seule ville mais une ville peut contenir plusieurs utilisateurs.
# Tu vas faire 10 villes en base avec Faker et les lier avec les utilisateurs du seed

# LES GOSSIPS
# Un utilisateur peut écrire plusieurs gossips mais un gossip ne peut être écrit que par un seul utilisateur.
# Tu vas faire 20 gossips en base avec Faker et les lier avec leur auteur.

# LES TAGS
# Un gossip peut avoir plusieurs tags et un tag peut être présent sur plusieurs gossip (genre #bromance).
# Tu vas faire 10 tags en base avec Faker. Chaque gossip aura (au minimum) un tag.

# LES MESSAGES PRIVÉS
# Un PM aura un expéditeur et un (ou plusieurs) destinataires.
# Tu vas faire quelques PM en base avec Faker et leur donner un expéditeur et un (ou plusieurs) destinataires.

# Bravo si t'es arrivé jusque-là !
# === Les exercices ci-dessous sont optionnels et ne seront pas évalué ===

# LES COMMENTAIRES
# Un gossip peut avoir plusieurs commentaires mais un commentaire ne peut correspondre qu'a un gossip précis.
# Les utilisateurs peuvent écrire plusieurs commentaires mais un commentaire n'a qu'un seul auteur.
# Tu vas faire 20 commentaires en base avec Faker et les lier avec leur auteur et le gossip associé.

# LES LIKES
# Un utilisateur peut mettre des likes sur des gossips ou des commentaires.
# Tu vas faire 20 likes en base avec Faker en les mettant à des commentaires ou des gossips au hasard. 
# City.destroy_all
# City.delete_all
# User.destroy_all
# Gossip.destroy_all
# Tag.destroy_all
# JoinTagToGossip.destroy_all
# PrivateMessage.destroy_all

10.times do |index|
    City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
    # puts "#{index+1} city created"
  end
  
  10.times do |index|
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
      description: Faker::Lorem.paragraphs,
      email: Faker::Internet.free_email,
      age: Faker::Number.between(from: 10, to: 60), city: City.find(rand(1..10)))
    #   puts "#{index+1} user created"
  end
  
  20.times do |index|
    Gossip.create(title: Faker::Quote.yoda, content: Faker::Lorem.paragraphs, user: User.find(rand(1..10)))
    puts "#{index+1} gossip created"
  end
  
  10.times do |index|
    Tag.create(title: Faker::Quote.singular_siegler)
    puts "#{index+1} tag created"
  end
  
  40.times do |index|
    JoinTagToGossip.create(tag: Tag.find(rand(1..10)), gossip: Gossip.find(rand(1..20)))
    puts "#{index+1} gossip taggé"
  end
  
  50.times do |index|
    pm = PrivateMessage.new(content: Faker::Lorem.paragraphs)
    pm.sender = User.find(rand(1..10))
    pm.recipient = User.find(rand(1..10))
    pm.save
  end
  