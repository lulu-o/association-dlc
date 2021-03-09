# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
puts "Cleaning Database..."
Partner.destroy_all
puts "Database cleaned"

puts "Creating Partners..."


Partner.create(name: 'Super U', address: 'place de la Roseraie', zipcode:'85290', city: 'Mortagne sur Sèvre')
Partner.create(name: 'Hyper U', address: 'route de Nantes', zipcode:'85000', city: 'La Roche sur Yon')
Partner.create(name: 'Hyper U', address: 'avenue de la Maine', zipcode:'85500', city: 'Les Herbiers')
Partner.create(name: 'Leclerc', address: 'avenue des Sables', zipcode:'49300', city: 'Cholet')
Partner.create(name: 'Espace Anjou', address: '75 avenue Montaigne', zipcode:'49000', city: 'Angers')
Partner.create(name: 'Monoprix Bouffay', address: '2 Rue de la Marne', zipcode:'44000', city: 'Nantes')
Partner.create(name: 'Carrefour Nantes Beaulieu', address: 'Rue Gaëtan Rondeau', zipcode:'44000', city: 'Nantes', latitude:'45.625', longitude:'44.254')
Partner.create(name: 'Carrefour Nantes Beaujoire', address: 'Route de Paris', zipcode:'44300', city: 'Nantes')
Partner.create(name: 'Auchan Nantes St-Herblain', address: '325 Route de Vannes', zipcode:'44800', city: 'St Herblain')
Partner.create(name: 'Auchan Nantes St-Sébastien', address: '2 Rue Pierre Mendès France', zipcode:'44230', city: 'St Sébastien sur Loire')
Partner.create(name: 'Leclerc Nantes Paridis', address: '14 route Paris Ccal Paridis', zipcode:'44300', city: 'Nantes')
Partner.create(name: 'Leclerc Basse Goulaine', address: 'Route de Clisson', zipcode:'44115', city: 'Basse Goulaine')
Partner.create(name: 'Super U Nantes Sud', address: '75 Boulevard Joliot Curie', zipcode:'44200', city: 'Nantes')
Partner.create(name: 'Super U Rezé', address: '22 Rue de la Galarnière', zipcode:'44400', city: 'Rezé')
Partner.create(name: 'Super U St Sébastien', address: '80 Boulevard des Pas Enchantés', zipcode:'44230', city: 'St Sébastien sur Loire')
Partner.create(name: 'Hyper U', address: '8 Avenue de la Libération', zipcode:'44620', city: 'La Montagne')
Partner.create(name: 'Super U', address: '20 Rue de Nantes', zipcode:'44880', city: 'Sautron')
Partner.create(name: 'Super U', address: 'Rue de la Malnoue', zipcode:'44470', city: 'Thouaré sur Loire')
Partner.create(name: 'Monoprix Calvaire', address: '2 Rue du Calvaire', zipcode:'44046', city: 'Nantes')

Partner.create(name: 'Lidl', address: 'Rue Salvador Allende, Place de la Croix Jeannette', zipcode:'44340', city: 'Bouguenais')
Partner.create(name: 'Lidl', address: 'Allée du Lac de Grand Lieu', zipcode:'44400', city: 'Rezé')
Partner.create(name: 'Lidl', address: '6 Rue de l\'Île Macé', zipcode:'44400', city: 'Rezé')
Partner.create(name: 'Lidl', address: '10 Boulevard Victor Hugo', zipcode:'44200', city: 'Nantes')
Partner.create(name: 'Lidl', address: '92 Route de Clisson', zipcode:'44200', city: 'Nantes')
Partner.create(name: 'Lidl', address: 'Rue de Beaugency', zipcode:'44230', city: 'St Sébastien sur Loire')
Partner.create(name: 'Lidl', address: '8 Boulevard de la Beaujoire', zipcode:'44300', city: 'Nantes')
Partner.create(name: 'Lidl', address: '6 Route de la Chapelle-sur-Erdre', zipcode:'44300', city: 'Nantes')
Partner.create(name: 'Intermarché Rezé', address: '29 Rue de la Blordière', zipcode:'44400', city: 'Rezé')
Partner.create(name: 'Intermarché', address: '173 Route de Saint-Joseph', zipcode:'44300', city: 'Nantes')
Partner.create(name: 'Intermarché', address: '54 Avenue de la Ferrière', zipcode:'44700', city: 'Orvault')
Partner.create(name: 'Intermarché', address: '5 BIS Rue du Lieutenant Auge', zipcode:'44230', city: 'St Sébastien sur Loire')
Partner.create(name: 'Aldi', address: 'Place des Dervallières', zipcode:'44100', city: 'Nantes')
Partner.create(name: 'Hyper U', address: 'Chemin de la Plage', zipcode:'44310', city: 'Saint-Philbert-de-Grand-Lieu')
Partner.create(name: 'Leclerc', address: 'Rue Amiral Duchaffault', zipcode:'85600', city: 'Montaigu')
puts "Partners created !"

puts "Creating users..."

User.create({first_name: "Erika", last_name: "NAUDON", address: "25 rue du château", zipcode: "44680", city: "Saint Mars de Coutais", email: "erika@dlc.org", password: "azerty"})

puts "Users created"
