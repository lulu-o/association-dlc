require "open-uri"

puts "Cleaning Database"
puts "Cleaning Distributions"
Distribution.destroy_all
puts "Cleaning Favorites"
Favorite.destroy_all
puts "Cleaning Harvesters"
Harvester.destroy_all
puts "Cleaning Contacts"
Contact.destroy_all
puts "Cleaning HarvestSlots"
HarvestSlot.destroy_all
puts "Cleaning Harvests"
Harvest.destroy_all
puts "Cleaning AssociationPartners"
AssociationPartner.destroy_all
puts "Cleaning Users"
User.destroy_all
puts "Cleaning Associations"
Association.destroy_all
puts "Cleaning Partners"
Partner.destroy_all
puts "Cleaning Brands"
Brand.destroy_all
puts "Database Cleaned"



puts "Creations Association DLC"
association_1 = Association.create({name: "Association DLC", address: "14 rue Malherbe", zipcode: "44000", city: "NANTES", latitude: "47.2178075", longitude: "-1.5477781"})


puts "Creating Users"
user_1 = User.create({my_association: association_1, first_name: "Antoine", last_name: "GALPY", address: "25 rue du château", zipcode: "44680", city: "Saint Mars de Coutais", email: "antoine@galpy.net", password: "azerty", active: true, admin: true})
user_2 = User.create({my_association: association_1, first_name: "Lucrece", last_name: "GUGELOT", address: "Place de l'église", zipcode: "44680", city: "Saint Mars de Coutais", email: "lucrece@dlc.org", password: "azerty", active: true, admin: true})
user_3 = User.create({my_association: association_1, first_name: "Charlotte", last_name: "NOVELLO", address: "53 la Guinanderie", zipcode: "44680", city: "Saint Mars de Coutais", email: "charlotte@dlc.org", password: "azerty", active: true, admin: true})
user_4 = User.create({my_association: association_1, first_name: "Céline", last_name: "MEILLERAY", address: "10 rue Félix Faure", zipcode: "44000", city: "Nantes", email: "celine@dlc.org", password: "azerty", active: true, admin: true})
user_5 = User.create({my_association: association_1, first_name: "Sonia", last_name: "FRICAUD", address: "10 rue du Père Noël", zipcode: "44000", city: "Nantes", email: "sonia@dlc.org", password: "azerty", active: true, admin: true})
user_6 = User.create({my_association: association_1, first_name: "Axel", last_name: "BAUDOIN", address: "3 rue des tests", zipcode: "44000", city: "Nantes", email: "axel@dlc.org", password: "azerty", active: true, admin: true})
puts "End of Users Creation"


puts "Creating Brands"
carrefour = Brand.create({name: "Carrefour", logo: "carrefour.png"})
netto = Brand.create({name: "Netto", logo: "netto.png"})
boulangerie_honore = Brand.create({name: "Boulangerie Honoré", logo: "boulangerie-honore.png"})
boulangerie_ange = Brand.create({name: "Boulangerie Ange", logo: "boulangerie-ange.png"})
intermarche = Brand.create({name: "Intermarché", logo: "intermarche.png"})
boulangerie_augustin = Brand.create({name: "Boulangerie Augustin", logo: "boulangerie-augustin.png"})
systeme_u = Brand.create({name: "Systeme U", logo: "systeme-u.png"})
potager_city = Brand.create({name: "Potager City", logo: "potager-city.png"})
puts "End of Brands Creating"


puts "Creating Partners"
partner_01 = Partner.create({brand: carrefour, name: "Carrefour Market Feydeau", address: "27 parvis Neptune", zipcode: "44000", city: "Nantes", harvesters_number: 2})
partner_02 = Partner.create({brand: netto, name: "Netto Chantenay", address: "Boulevard Jean Moulin", zipcode: "44100", city: "Nantes", harvesters_number: 2})
partner_03 = Partner.create({brand: boulangerie_honore, name: "Honoré Rond point de Rennes", address: "10 Boulevard Lelasseur", zipcode: "44000", city: "Nantes", harvesters_number: 2})
partner_04 = Partner.create({brand: boulangerie_honore, name: "Honoré Carnot", address: "12 Avenue Carnot", zipcode: "44000", city: "Nantes", harvesters_number: 2})
partner_05 = Partner.create({brand: boulangerie_honore, name: "Honoré Canclaux", address: "2 Place Catinat", zipcode: "44100", city: "Nantes", harvesters_number: 2})
partner_06 = Partner.create({brand: boulangerie_ange, name: "Ange Rezé", address: "2 Rue Ordronneau", zipcode: "44400", city: "Rezé", harvesters_number: 2})
partner_07 = Partner.create({brand: intermarche, name: "Intermarché Chantenay", address: "32 Rue de la Marseillaise", zipcode: "44100", city: "Nantes", harvesters_number: 2})
partner_08 = Partner.create({brand: intermarche, name: "Intermaché Eraudière", address: "173 Route de Saint-Joseph", zipcode: "44300", city: "Nantes", harvesters_number: 2})
partner_09 = Partner.create({brand: boulangerie_augustin, name: "Augustin Beaujoire", address: "1 Boulevard de la Beaujoire", zipcode: "44300", city: "Nantes", harvesters_number: 2})
partner_10 = Partner.create({brand: systeme_u, name: "Super U PT St Martin", address: "Rue des Vignes", zipcode: "44860", city: "Pont Saint Martin", harvesters_number: 2})
partner_11 = Partner.create({brand: systeme_u, name: "Super U St Philbert de grandlieu", address: "Chemin de la Plage", zipcode: "44310", city: "Saint-Philbert-de-Grand-Lieu", harvesters_number: 2})
partner_12 = Partner.create({brand: systeme_u, name: "Super U Bouaye", address: "53 Rue de Nantes", zipcode: "44830", city: "Bouaye", harvesters_number: 2})
partner_13 = Partner.create({brand: systeme_u, name: "Super U Sainte-Pazanne", address: "Rue des Charmes", zipcode: "44680", city: "Sainte-Pazanne", harvesters_number: 2})
partner_14 = Partner.create({brand: potager_city, name: "Potager City Les Sorinières", address: "1 B Rue Du Progres", zipcode: "44840", city: "LES SORINIERES", harvesters_number: 2})
partner_15 = Partner.create({brand: carrefour, name: "Carrefour Express Angers Lorette", address: "Bd Joseph Bédier", zipcode: "49000", city: "ANGERS", harvesters_number: 2})
partner_16 = Partner.create({brand: carrefour, name: "Carrefour City Angers Hérault", address: "3 Place Hérault", zipcode: "49100", city: "ANGERS", harvesters_number: 2})
partner_17 = Partner.create({brand: intermarche, name: "Intermarché Avrillé", address: "2 Rue Michel Seurat", zipcode: "49000", city: "ANGERS", harvesters_number: 2})
partner_18 = Partner.create({brand: netto, name: "Netto Cholet", address: "36 Rue de l'Abbé de l'Épée", zipcode: "49300", city: "CHOLET", harvesters_number: 2})
puts "End of Partners Creating"


puts "Creating Association Partners"
association_partner_01 = AssociationPartner.create({my_association: association_1, partner: partner_01})
association_partner_02 = AssociationPartner.create({my_association: association_1, partner: partner_02})
association_partner_03 = AssociationPartner.create({my_association: association_1, partner: partner_03})
association_partner_04 = AssociationPartner.create({my_association: association_1, partner: partner_04})
association_partner_05 = AssociationPartner.create({my_association: association_1, partner: partner_05})
association_partner_06 = AssociationPartner.create({my_association: association_1, partner: partner_06})
association_partner_07 = AssociationPartner.create({my_association: association_1, partner: partner_07})
association_partner_08 = AssociationPartner.create({my_association: association_1, partner: partner_08})
association_partner_09 = AssociationPartner.create({my_association: association_1, partner: partner_09})
association_partner_10 = AssociationPartner.create({my_association: association_1, partner: partner_10})
association_partner_11 = AssociationPartner.create({my_association: association_1, partner: partner_11})
association_partner_12 = AssociationPartner.create({my_association: association_1, partner: partner_12})
association_partner_13 = AssociationPartner.create({my_association: association_1, partner: partner_13})
association_partner_14 = AssociationPartner.create({my_association: association_1, partner: partner_14})
association_partner_15 = AssociationPartner.create({my_association: association_1, partner: partner_15})
association_partner_16 = AssociationPartner.create({my_association: association_1, partner: partner_16})
association_partner_17 = AssociationPartner.create({my_association: association_1, partner: partner_17})
association_partner_18 = AssociationPartner.create({my_association: association_1, partner: partner_18})
puts "End Of Association Partners Creating"


puts "Creating Harvests Slots"
harvest_slot_11 = HarvestSlot.create({partner: partner_01, day_of_the_week: 1, hour: "18:30:00"})
harvest_slot_13 = HarvestSlot.create({partner: partner_01, day_of_the_week: 3, hour: "18:30:00"})
harvest_slot_15 = HarvestSlot.create({partner: partner_01, day_of_the_week: 5, hour: "18:30:00"})
harvest_slot_16 = HarvestSlot.create({partner: partner_01, day_of_the_week: 6, hour: "18:30:00"})

harvest_slot_21 = HarvestSlot.create({partner: partner_02, day_of_the_week: 1, hour: "18:45:00"})
harvest_slot_22 = HarvestSlot.create({partner: partner_02, day_of_the_week: 2, hour: "18:45:00"})
harvest_slot_23 = HarvestSlot.create({partner: partner_02, day_of_the_week: 3, hour: "18:45:00"})
harvest_slot_24 = HarvestSlot.create({partner: partner_02, day_of_the_week: 4, hour: "18:45:00"})

harvest_slot_30 = HarvestSlot.create({partner: partner_03, day_of_the_week: 0, hour: "19:00:00"})
harvest_slot_31 = HarvestSlot.create({partner: partner_03, day_of_the_week: 1, hour: "19:00:00"})
harvest_slot_32 = HarvestSlot.create({partner: partner_03, day_of_the_week: 2, hour: "19:00:00"})
harvest_slot_33 = HarvestSlot.create({partner: partner_03, day_of_the_week: 3, hour: "19:00:00"})
harvest_slot_34 = HarvestSlot.create({partner: partner_03, day_of_the_week: 4, hour: "19:00:00"})
harvest_slot_35 = HarvestSlot.create({partner: partner_03, day_of_the_week: 5, hour: "19:00:00"})
harvest_slot_36 = HarvestSlot.create({partner: partner_03, day_of_the_week: 6, hour: "19:00:00"})

harvest_slot_40 = HarvestSlot.create({partner: partner_04, day_of_the_week: 0, hour: "19:00:00"})
harvest_slot_41 = HarvestSlot.create({partner: partner_04, day_of_the_week: 1, hour: "19:00:00"})
harvest_slot_42 = HarvestSlot.create({partner: partner_04, day_of_the_week: 2, hour: "19:00:00"})
harvest_slot_43 = HarvestSlot.create({partner: partner_04, day_of_the_week: 3, hour: "19:00:00"})
harvest_slot_44 = HarvestSlot.create({partner: partner_04, day_of_the_week: 4, hour: "19:00:00"})
harvest_slot_45 = HarvestSlot.create({partner: partner_04, day_of_the_week: 5, hour: "19:00:00"})
harvest_slot_46 = HarvestSlot.create({partner: partner_04, day_of_the_week: 6, hour: "19:00:00"})

harvest_slot_50 = HarvestSlot.create({partner: partner_05, day_of_the_week: 0, hour: "19:00:00"})
harvest_slot_51 = HarvestSlot.create({partner: partner_05, day_of_the_week: 1, hour: "19:00:00"})
harvest_slot_52 = HarvestSlot.create({partner: partner_05, day_of_the_week: 2, hour: "19:00:00"})
harvest_slot_53 = HarvestSlot.create({partner: partner_05, day_of_the_week: 3, hour: "19:00:00"})
harvest_slot_54 = HarvestSlot.create({partner: partner_05, day_of_the_week: 4, hour: "19:00:00"})
harvest_slot_55 = HarvestSlot.create({partner: partner_05, day_of_the_week: 5, hour: "19:00:00"})
harvest_slot_56 = HarvestSlot.create({partner: partner_05, day_of_the_week: 6, hour: "19:00:00"})
puts "End Of Harvests Slots Creating"


puts "Creating Contacts"
contact_01 = Contact.create({partner: partner_01, first_name: "Julien", phone_number: "0240463395", role: "Accueil"})
contact_02 = Contact.create({partner: partner_02, first_name: "Marie", phone_number: "0240463625", role: "Accueil"})
contact_03 = Contact.create({partner: partner_03, first_name: "Rosa", phone_number: "0240495281", role: "Accueil"})
contact_04 = Contact.create({partner: partner_04, first_name: "Caroline", last_name: "DAVID", phone_number: "0228164521", role: "Accueil"})
contact_05 = Contact.create({partner: partner_05, first_name: "Nathalie", last_name: "DELORME", phone_number: "0240302614", role: "Accueil"})
contact_06 = Contact.create({partner: partner_06, first_name: "Antoine", phone_number: "0240492354", role: "Accueil"})
contact_07 = Contact.create({partner: partner_07, first_name: "Emmanuel", phone_number: "0228229051", role: "Accueil"})
contact_08 = Contact.create({partner: partner_08, first_name: "Coralie", phone_number: "0676740678", role: "Accueil"})
contact_09 = Contact.create({partner: partner_09, first_name: "Hélène",  last_name: "FAGES", phone_number: "0973518130", role: "Accueil"})
contact_10 = Contact.create({partner: partner_10, first_name: "François", phone_number: "0251841742", role: "Accueil"})
contact_11 = Contact.create({partner: partner_11, first_name: "Anthony", last_name: "POTIRON", phone_number: "0240893862", role: "Accueil"})
contact_12 = Contact.create({partner: partner_12, first_name: "Francis", last_name: "CALBOT", phone_number: "0276777167", role: "Accueil"})
contact_13 = Contact.create({partner: partner_13, first_name: "Corentin", phone_number: "0212877167", role: "Accueil"})
contact_14 = Contact.create({partner: partner_14, first_name: "Pierre-Emmanuel", last_name: "FAYE", phone_number: "0289778910", role: "Accueil"})
puts "End Of Contacts Creating"

puts "Creating Harvests"
harvest_01 = Harvest.create({my_association: association_1, partner: partner_02, date: "2022-02-19", harvesters_number: 2, hour: "18:45:00"})
harvest_02 = Harvest.create({my_association: association_1, partner: partner_02, date: "2022-02-20", harvesters_number: 2, hour: "18:45:00"})
harvest_03 = Harvest.create({my_association: association_1, partner: partner_02, date: "2022-02-21", harvesters_number: 2, hour: "18:45:00"})
harvest_04 = Harvest.create({my_association: association_1, partner: partner_03, date: "2022-02-22", harvesters_number: 2, hour: "19:00:00"})
harvest_05 = Harvest.create({my_association: association_1, partner: partner_03, date: "2022-02-23", harvesters_number: 2, hour: "19:00:00"})
harvest_06 = Harvest.create({my_association: association_1, partner: partner_03, date: "2022-02-24", harvesters_number: 2, hour: "19:00:00"})
harvest_07 = Harvest.create({my_association: association_1, partner: partner_03, date: "2022-02-25", harvesters_number: 2, hour: "19:00:00"})
harvest_08 = Harvest.create({my_association: association_1, partner: partner_04, date: "2022-02-19", harvesters_number: 2, hour: "19:00:00"})
harvest_09 = Harvest.create({my_association: association_1, partner: partner_04, date: "2022-02-20", harvesters_number: 2, hour: "19:00:00"})
harvest_10 = Harvest.create({my_association: association_1, partner: partner_04, date: "2022-02-21", harvesters_number: 2, hour: "19:00:00"})
harvest_11 = Harvest.create({my_association: association_1, partner: partner_04, date: "2022-02-22", harvesters_number: 2, hour: "19:00:00"})
harvest_12 = Harvest.create({my_association: association_1, partner: partner_04, date: "2022-02-23", harvesters_number: 2, hour: "19:00:00"})
harvest_13 = Harvest.create({my_association: association_1, partner: partner_05, date: "2022-02-24", harvesters_number: 2, hour: "19:00:00"})
harvest_14 = Harvest.create({my_association: association_1, partner: partner_05, date: "2022-02-25", harvesters_number: 2, hour: "19:00:00"})
harvest_15 = Harvest.create({my_association: association_1, partner: partner_12, date: "2022-02-19", harvesters_number: 2, hour: "18:30:00"})
harvest_16 = Harvest.create({my_association: association_1, partner: partner_02, date: "2022-02-20", harvesters_number: 2, hour: "18:15:00"})
harvest_17 = Harvest.create({my_association: association_1, partner: partner_03, date: "2022-02-21", harvesters_number: 2, hour: "18:45:00"})
harvest_18 = Harvest.create({my_association: association_1, partner: partner_04, date: "2022-02-22", harvesters_number: 2, hour: "19:00:00"})
harvest_19 = Harvest.create({my_association: association_1, partner: partner_05, date: "2022-02-23", harvesters_number: 2, hour: "18:45:00"})
harvest_20 = Harvest.create({my_association: association_1, partner: partner_06, date: "2022-02-24", harvesters_number: 2, hour: "18:45:00"})
harvest_21 = Harvest.create({my_association: association_1, partner: partner_07, date: "2022-02-25", harvesters_number: 2, hour: "18:15:00"})
harvest_22 = Harvest.create({my_association: association_1, partner: partner_13, date: "2022-02-19", harvesters_number: 2, hour: "19:00:00"})
harvest_23 = Harvest.create({my_association: association_1, partner: partner_14, date: "2022-02-20", harvesters_number: 2, hour: "18:15:00"})
harvest_24 = Harvest.create({my_association: association_1, partner: partner_01, date: "2022-01-21", harvesters_number: 2, hour: "18:45:00"})
harvest_25 = Harvest.create({my_association: association_1, partner: partner_02, date: "2022-02-22", harvesters_number: 2, hour: "18:45:00"})
harvest_26 = Harvest.create({my_association: association_1, partner: partner_03, date: "2022-02-23", harvesters_number: 2, hour: "18:45:00"})
harvest_27 = Harvest.create({my_association: association_1, partner: partner_04, date: "2022-02-24", harvesters_number: 2, hour: "18:45:00"})
harvest_28 = Harvest.create({my_association: association_1, partner: partner_05, date: "2022-02-25", harvesters_number: 2, hour: "18:45:00"})
harvest_29 = Harvest.create({my_association: association_1, partner: partner_11, date: "2022-02-19", harvesters_number: 2, hour: "19:00:00"})
harvest_30 = Harvest.create({my_association: association_1, partner: partner_12, date: "2022-02-20", harvesters_number: 2, hour: "18:30:00"})
harvest_31 = Harvest.create({my_association: association_1, partner: partner_13, date: "2022-02-21", harvesters_number: 2, hour: "18:30:00"})
harvest_32 = Harvest.create({my_association: association_1, partner: partner_14, date: "2022-02-22", harvesters_number: 2, hour: "18:45:00"})
harvest_33 = Harvest.create({my_association: association_1, partner: partner_01, date: "2022-02-23", harvesters_number: 2, hour: "18:45:00"})
harvest_34 = Harvest.create({my_association: association_1, partner: partner_02, date: "2022-02-24", harvesters_number: 2, hour: "18:30:00"})
harvest_35 = Harvest.create({my_association: association_1, partner: partner_03, date: "2022-02-25", harvesters_number: 2, hour: "19:00:00"})
harvest_36 = Harvest.create({my_association: association_1, partner: partner_09, date: "2022-02-19", harvesters_number: 2, hour: "19:00:00"})
harvest_37 = Harvest.create({my_association: association_1, partner: partner_10, date: "2022-02-20", harvesters_number: 2, hour: "18:45:00"})
harvest_38 = Harvest.create({my_association: association_1, partner: partner_11, date: "2022-02-21", harvesters_number: 2, hour: "18:45:00"})
harvest_39 = Harvest.create({my_association: association_1, partner: partner_12, date: "2022-02-22", harvesters_number: 2, hour: "18:30:00"})
harvest_40 = Harvest.create({my_association: association_1, partner: partner_13, date: "2022-02-23", harvesters_number: 2, hour: "18:15:00"})
harvest_41 = Harvest.create({my_association: association_1, partner: partner_14, date: "2022-02-24", harvesters_number: 2, hour: "18:45:00"})
harvest_42 = Harvest.create({my_association: association_1, partner: partner_01, date: "2022-02-25", harvesters_number: 2, hour: "18:30:00"})
harvest_43 = Harvest.create({my_association: association_1, partner: partner_07, date: "2022-02-19", harvesters_number: 2, hour: "18:30:00"})
harvest_44 = Harvest.create({my_association: association_1, partner: partner_08, date: "2022-02-20", harvesters_number: 2, hour: "18:15:00"})
harvest_45 = Harvest.create({my_association: association_1, partner: partner_09, date: "2022-02-21", harvesters_number: 2, hour: "18:45:00"})
harvest_46 = Harvest.create({my_association: association_1, partner: partner_10, date: "2022-02-22", harvesters_number: 2, hour: "18:45:00"})
harvest_47 = Harvest.create({my_association: association_1, partner: partner_11, date: "2022-02-23", harvesters_number: 2, hour: "18:30:00"})
harvest_48 = Harvest.create({my_association: association_1, partner: partner_12, date: "2022-02-24", harvesters_number: 2, hour: "18:45:00"})
harvest_49 = Harvest.create({my_association: association_1, partner: partner_13, date: "2022-02-25", harvesters_number: 2, hour: "18:15:00"})



harvest_50 = Harvest.create({my_association: association_1, partner: partner_01, date: "2022-02-22", harvesters_number: 2, hour: "18:00:00"})
harvest_51 = Harvest.create({my_association: association_1, partner: partner_01, date: "2022-02-24", harvesters_number: 2, hour: "18:00:00"})
puts "End Of Harvests Creating"


puts "Creating Harvesters"
harvester_01 = Harvester.create({user: user_1, harvest: harvest_01})
harvester_03 = Harvester.create({user: user_3, harvest: harvest_02})
harvester_05 = Harvester.create({user: user_5, harvest: harvest_03})
harvester_07 = Harvester.create({user: user_2, harvest: harvest_04})
harvester_09 = Harvester.create({user: user_4, harvest: harvest_05})
harvester_10 = Harvester.create({user: user_5, harvest: harvest_05})
harvester_11 = Harvester.create({user: user_1, harvest: harvest_06})
harvester_14 = Harvester.create({user: user_4, harvest: harvest_07})
harvester_15 = Harvester.create({user: user_5, harvest: harvest_08})
harvester_17 = Harvester.create({user: user_1, harvest: harvest_09})
harvester_18 = Harvester.create({user: user_2, harvest: harvest_10})
harvester_19 = Harvester.create({user: user_3, harvest: harvest_11})
harvester_20 = Harvester.create({user: user_4, harvest: harvest_12})
harvester_21 = Harvester.create({user: user_5, harvest: harvest_13})
harvester_22 = Harvester.create({user: user_1, harvest: harvest_14})
harvester_23 = Harvester.create({user: user_2, harvest: harvest_15})
harvester_24 = Harvester.create({user: user_3, harvest: harvest_16})
harvester_25 = Harvester.create({user: user_4, harvest: harvest_17})
harvester_26 = Harvester.create({user: user_5, harvest: harvest_18})
harvester_27 = Harvester.create({user: user_1, harvest: harvest_19})
harvester_28 = Harvester.create({user: user_2, harvest: harvest_20})
harvester_29 = Harvester.create({user: user_3, harvest: harvest_21})
harvester_30 = Harvester.create({user: user_4, harvest: harvest_22})
harvester_31 = Harvester.create({user: user_5, harvest: harvest_23})
harvester_32 = Harvester.create({user: user_1, harvest: harvest_24})
harvester_33 = Harvester.create({user: user_2, harvest: harvest_25})
harvester_34 = Harvester.create({user: user_3, harvest: harvest_26})
harvester_35 = Harvester.create({user: user_4, harvest: harvest_27})
harvester_36 = Harvester.create({user: user_5, harvest: harvest_28})
harvester_37 = Harvester.create({user: user_1, harvest: harvest_29})
harvester_38 = Harvester.create({user: user_1, harvest: harvest_30})
harvester_39 = Harvester.create({user: user_2, harvest: harvest_31})
harvester_40 = Harvester.create({user: user_3, harvest: harvest_32})
harvester_41 = Harvester.create({user: user_4, harvest: harvest_33})
harvester_42 = Harvester.create({user: user_5, harvest: harvest_34})
harvester_43 = Harvester.create({user: user_1, harvest: harvest_35})
harvester_44 = Harvester.create({user: user_2, harvest: harvest_36})
harvester_45 = Harvester.create({user: user_3, harvest: harvest_37})
harvester_46 = Harvester.create({user: user_4, harvest: harvest_38})
harvester_47 = Harvester.create({user: user_5, harvest: harvest_39})
harvester_48 = Harvester.create({user: user_1, harvest: harvest_40})
harvester_51 = Harvester.create({user: user_4, harvest: harvest_43})
harvester_53 = Harvester.create({user: user_1, harvest: harvest_45})
harvester_54 = Harvester.create({user: user_2, harvest: harvest_46})
harvester_55 = Harvester.create({user: user_3, harvest: harvest_47})
harvester_56 = Harvester.create({user: user_4, harvest: harvest_48})
harvester_57 = Harvester.create({user: user_5, harvest: harvest_49})
puts "End Of Harvesters Creating"


puts "Creating Favorites"
favorite_11 = Favorite.create({user: user_1, partner: partner_01})
favorite_12 = Favorite.create({user: user_1, partner: partner_03})
favorite_13 = Favorite.create({user: user_1, partner: partner_05})
favorite_21 = Favorite.create({user: user_2, partner: partner_07})
favorite_22 = Favorite.create({user: user_2, partner: partner_09})
favorite_23 = Favorite.create({user: user_2, partner: partner_11})
favorite_31 = Favorite.create({user: user_3, partner: partner_13})
favorite_32 = Favorite.create({user: user_3, partner: partner_02})
favorite_33 = Favorite.create({user: user_3, partner: partner_04})
favorite_41 = Favorite.create({user: user_4, partner: partner_06})
favorite_42 = Favorite.create({user: user_4, partner: partner_08})
favorite_43 = Favorite.create({user: user_4, partner: partner_01})
favorite_51 = Favorite.create({user: user_5, partner: partner_03})
favorite_52 = Favorite.create({user: user_5, partner: partner_05})
favorite_53 = Favorite.create({user: user_5, partner: partner_07})
puts "End Of Favorites Creating"

