# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# require "open-uri"

# puts "Cleaning Database"
# Booking.destroy_all
# puts "Booking destroyed"
# Boat.destroy_all
# puts "Boat destroyed"
# User.destroy_all
# puts "User destroyed"


# puts "Adding Users"
# file = File.open(Rails.root.join("db", "seeds", "images", "Erika.jpg"))
# user_1 = User.create({first_name: "Erika", last_name: "NAUDON", address: "25 rue du château", zipcode: "44680", city: "Saint Mars de Coutais", username: "erika", email: "erika@dlc.org", password: "azerty"})
# user_1.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')

# file = File.open(Rails.root.join("db", "seeds", "images", "Lucrece.jpg"))
# user_2 = User.create({first_name: "Lucrece", last_name: "GUGELOT", address: "Place de l'église", zipcode: "44680", city: "Saint Mars de Coutais", username: "lucrece", email: "lucrece@dlc.org", password: "azerty"})
# user_2.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')

# file = File.open(Rails.root.join("db", "seeds", "images", "Lucrece.jpg"))
# user_3 = User.create({first_name: "Charlotte", last_name: "NOVELLO", address: "53 la Guinanderie", zipcode: "44680", city: "Saint Mars de Coutais", username: "charlotte", email: "charlotte@dlc.org", password: "azerty"})
# user_3.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')

# file = File.open(Rails.root.join("db", "seeds", "images", "Celine.jpg"))
# user_4 = User.create({first_name: "Céline", last_name: "MEILLERAY", address: "10 rue Félix Faure", zipcode: "44000", city: "Nantes", username: "celine", email: "celine@dlc.org", password: "azerty"})
# user_4.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')

# file = File.open(Rails.root.join("db", "seeds", "images", "Sonia.jpg"))
# user_5 = User.create({first_name: "Sonia", last_name: "FRICAUD", address: "10 rue Félix Faure", zipcode: "44000", city: "Nantes", username: "celine", email: "celine@dlc.org", password: "azerty"})
# user_5.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')

# puts "End of Adding Users"


