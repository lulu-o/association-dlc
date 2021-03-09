require "open-uri"

puts "Cleaning Database"
puts "Cleaning Users"
User.destroy_all
puts "Cleaning Associations"
Association.destroy_all
puts "Database Cleaned"

association_1 = Association.create({name: "Association DLC", address: "14 rue Malherbe", zipcode: "44000", city: "NANTES", latitude: "47.2178075", longitude: "-1.5477781"})

puts "Adding Users"
user_1 = User.create({my_association: association_1, first_name: "Erika", last_name: "NAUDON", address: "25 rue du château", zipcode: "44680", city: "Saint Mars de Coutais", email: "erika@dlc.org", password: "azerty", active: true, admin: true})
user_2 = User.create({my_association: association_1, first_name: "Lucrece", last_name: "GUGELOT", address: "Place de l'église", zipcode: "44680", city: "Saint Mars de Coutais", email: "lucrece@dlc.org", password: "azerty", active: true, admin: true})
user_3 = User.create({my_association: association_1, first_name: "Charlotte", last_name: "NOVELLO", address: "53 la Guinanderie", zipcode: "44680", city: "Saint Mars de Coutais", email: "charlotte@dlc.org", password: "azerty", active: true, admin: true})
user_4 = User.create({my_association: association_1, first_name: "Céline", last_name: "MEILLERAY", address: "10 rue Félix Faure", zipcode: "44000", city: "Nantes", email: "celine@dlc.org", password: "azerty", active: true, admin: true})
user_5 = User.create({my_association: association_1, first_name: "Sonia", last_name: "FRICAUD", address: "10 rue du Père Noël", zipcode: "44000", city: "Nantes", email: "sonia@dlc.org", password: "azerty", active: true, admin: true})
puts "End of Adding Users"
