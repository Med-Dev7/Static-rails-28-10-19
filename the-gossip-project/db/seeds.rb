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

# 10.times do |index|
#     City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
#     # puts "#{index+1} city created"
#   end
  
#   10.times do |index|
#     User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
#       description: Faker::Lorem.paragraphs,
#       email: Faker::Internet.free_email,
#       age: Faker::Number.between(from: 10, to: 60), city: City.find(rand(1..10)))
#     #   puts "#{index+1} user created"
#   end
  
#   20.times do |index|
#     Gossip.create(title: Faker::Quote.yoda, content: Faker::Lorem.paragraphs, user: User.find(rand(1..10)))
#     puts "#{index+1} gossip created"
#   end
  
#   10.times do |index|
#     Tag.create(title: Faker::Quote.singular_siegler)
#     puts "#{index+1} tag created"
#   end
  
#   40.times do |index|
#     JoinTagToGossip.create(tag: Tag.find(rand(1..10)), gossip: Gossip.find(rand(1..20)))
#     puts "#{index+1} gossip taggé"
#   end
  
#   50.times do |index|
#     pm = PrivateMessage.new(content: Faker::Lorem.paragraphs)
#     pm.sender = User.find(rand(1..10))
#     pm.recipient = User.find(rand(1..10))
#     pm.save
#   end


# # building cities (requires nothing)
# 10.times do
#   City.create(name: Faker::Address.unique.city, zip_code: Faker::Address.unique.zip)
# end

# # create some users (requires cities)
# 10.times do
#   name = Faker::FunnyName.unique.two_word_name
#   description = Faker::Lorem.sentence(word_count: 10,random_words_to_add: 5)
#   email = Faker::Internet.unique.safe_email(name: name)
#   name = name.split(' ')
#   age = rand(16..70)
#   User.create(first_name: name[0], last_name: name[1],
#   description: description, email: email, age: age,
#   city_id: City.all.sample.id)
# end

# # getting to the gossips (requires users)
# 20.times do
#   title = Faker::Book.unique.title
#   sentences = rand(3..8)
#   content = ([Faker::Lorem.sentence(word_count: 5,random_words_to_add: 15)] * sentences).join(' ')
#   user = rand(1..10)
#   Gossip.create(title: title, content: content, user_id: user)
# end






# # drawing some tags (requires nothing)
# tags = [
#   'sexual assault', 'racist behavior', 'lack of kindness',
#   'fake romance', 'useless', 'fake news', 'hearsay', 'trash talk',
#   'homophobia', 'transphobia'
# ]

# tags.each do |tag|
#   Tag.create(title: tag)
# end

# # creating the gossip_metum exchange table (requires gossips, tags)
# Gossip.all.each do |gossip| # making sure each gossip has at least one tag
#   tag_ids = Tag.all.sample(4).map { |tag| tag.id } # selecting 4 random tag ids
#   tag_ids.each do |id| # creating the meta
#       GossipMetum.create(gossip_id: gossip.id, tag_id: id)
#   end
# end

# # creating private messages (requires users)
# 20.times do
#   subject = Faker::Lorem.sentence(word_count: 5)
#   content = Faker::Lorem.sentence(word_count: 10) + ' ' + Faker::Lorem.sentence(word_count: 10)
#   PrivateMessage.create(subject: subject, content: content, sender_id: User.all.sample.id)
# end

# # creating message_delivering objects (requires private_messages & users)
# PrivateMessage.all.each do |message|
#   recipients = (User.all - [message.sender]).sample(5)
#   recipients.each do |recipient|
#     MessageDelivering.create(recipient_id: recipient.id, received_message_id: message.id)
#   end
# end

# # creating comments on gossips (requires users and gossips)
# 20.times do
#   content = Faker::Lorem.sentence(word_count: 8)
#   Comment.create(user_id: User.all.sample.id, content: content, commentable: Gossip.all.sample)
# end

# # creating likes
# 20.times do
#   user = User.all.sample.id
#   # half for gossips, half for comments
#   rand > 0.5 ? Like.create(user_id: user, gossip_id: Gossip.all.sample.id) : Like.create(user_id: user, comment_id: Comment.all.sample.id)
# end

# # creating comments v2 (requires users, gossips, and some comments)
# 20.times do
#   content = Faker::Lorem.sentence(word_count: 4)
#   # half for gossips, half for comments
#   rand > 0.5 ? commentable = Gossip.all.sample : commentable = Comment.all.sample
#   Comment.create(user_id: User.all.sample.id, content: content, commentable: commentable)
# end

# building cities (requires nothing)

10.times do
  City.create(name: Faker::Address.unique.city, zip_code: Faker::Address.unique.zip)
end

# create some users (requires cities)
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  description = Faker::Movie.quote
  email = Faker::Internet.email(name: first_name)
  age = rand(16..70)
  User.create(first_name: first_name, last_name: last_name,
  description: description, email: email, age: age,
  city_id: City.all.sample.id,
  password: "ok")
end

# getting to the gossips (requires users)
20.times do
  title = Faker::Book.unique.title
  content = Faker::Quote.yoda
  user = rand(1..10)
  Gossip.create(title: title, content: content, user_id: user)
end

10.times do 
  Tag.create(title: Faker::Quote.singular_siegler)
end


Gossip.all.each do |gossip| # making sure each gossip has at least one tag
  tag_ids = Tag.all.sample(4).map { |tag| tag.id } # selecting 4 random tag ids
  tag_ids.each do |id| # creating the meta
    JoinTagToGossip.create(tag_id: id, gossip_id: gossip.id)
  end
end

20.times do
  sender =  User.all.sample.id
  recipient =  User.all.sample.id
  pm = PrivateMessage.create(content: Faker::Lorem.paragraphs, recipient_id: recipient, sender_id: sender )
end
