require "open-uri"

puts "Cleaning Database"
puts "Cleaning Users"
User.destroy_all
puts "Cleaning Associations"
Association.destroy_all
puts "Cleaning Partners"
Partner.destroy_all
puts "Cleaning Brands"
Brand.destroy_all

puts "Database Cleaned"

association_1 = Association.create({name: "Association DLC", address: "14 rue Malherbe", zipcode: "44000", city: "NANTES", latitude: "47.2178075", longitude: "-1.5477781"})

puts "Adding Users"
user_1 = User.create({my_association: association_1, first_name: "Erika", last_name: "NAUDON", address: "25 rue du château", zipcode: "44680", city: "Saint Mars de Coutais", email: "erika@dlc.org", password: "azerty", active: true, admin: true})
user_2 = User.create({my_association: association_1, first_name: "Lucrece", last_name: "GUGELOT", address: "Place de l'église", zipcode: "44680", city: "Saint Mars de Coutais", email: "lucrece@dlc.org", password: "azerty", active: true, admin: true})
user_3 = User.create({my_association: association_1, first_name: "Charlotte", last_name: "NOVELLO", address: "53 la Guinanderie", zipcode: "44680", city: "Saint Mars de Coutais", email: "charlotte@dlc.org", password: "azerty", active: true, admin: true})
user_4 = User.create({my_association: association_1, first_name: "Céline", last_name: "MEILLERAY", address: "10 rue Félix Faure", zipcode: "44000", city: "Nantes", email: "celine@dlc.org", password: "azerty", active: true, admin: true})
user_5 = User.create({my_association: association_1, first_name: "Sonia", last_name: "FRICAUD", address: "10 rue du Père Noël", zipcode: "44000", city: "Nantes", email: "sonia@dlc.org", password: "azerty", active: true, admin: true})
puts "End of Adding Users"


puts "Adding Brands"
carrefour = Brand.create({name: "Carrefour", logo: "https://e7.pngegg.com/pngimages/592/86/png-clipart-carrefour-online-marketing-business-hypermarket-marketing-text-retail.png"})
netto = Brand.create({name: "Netto", logo: "https://banner2.cleanpng.com/20180715/pbh/kisspng-netto-marken-discount-supermarket-discount-shop-co-netto-logo-5b4b46be2ef505.7313158715316599661924.jpg"})
boulangerie_honore = Brand.create({name: "Boulangerie Honoré", logo: "https://static4.pagesjaunes.fr/media/cviv/54456614-35ac0f7bab9faaf40079b1050c742020"})
boulangerie_ange = Brand.create({name: "Boulangerie Ange", logo: "https://upload.wikimedia.org/wikipedia/fr/8/8e/Logo_Boulangerie_Ange.png"})
intermarche = Brand.create({name: "Intermarché", logo: "https://images.ctfassets.net/26cqtpvnd0cd/NyecMADUMS8OQSo2Seuwi/d8ea253e85218964ef6a8268e79f83f0/Fichier_1.png"})
boulangerie_augustin = Brand.create({name: "Boulangerie Augustin", logo: "https://www.centre-commercial.fr/carrefour-iroise/wp-content/uploads/sites/73/2017/05/augus-1.jpg"})
systeme_u = Brand.create({name: "Systeme U", logo: "https://upload.wikimedia.org/wikipedia/fr/thumb/1/10/Syst%C3%A8me_U_logo_2009.svg/1395px-Syst%C3%A8me_U_logo_2009.svg.png"})
potager_city = Brand.create({name: "Potager City", logo: "https://www.potagercity.fr/images/logo-121x70@2x.png"})
puts "End of Adding Brands"


puts "Adding Partners"
partner_01 = Partner.create({brand: carrefour, name: "Carrefour Market Feydeau", address: "27 parvis Neptune", zipcode: "44000", city: "Nantes", harvesters_number: 2})
partner_02 = Partner.create({brand: netto, name: "Netto Chantenay", address: "Boulevard Jean Moulin", zipcode: "44100", city: "Nantes", harvesters_number: 2})
partner_03 = Partner.create({brand: boulangerie_honore, name: "Honoré Rond point de Rennes", address: "10 Boulevard Lelasseur", zipcode: "44000", city: "Nantes", harvesters_number: 1})
partner_04 = Partner.create({brand: boulangerie_honore, name: "Honoré Carnot", address: "12 Avenue Carnot", zipcode: "44000", city: "Nantes", harvesters_number: 1})
partner_05 = Partner.create({brand: boulangerie_honore, name: "Honoré Canclaux", address: "2 Place Catinat", zipcode: "44100", city: "Nantes", harvesters_number: 1})
partner_06 = Partner.create({brand: boulangerie_ange, name: "Ange Rezé", address: "2 Rue Ordronneau", zipcode: "44400", city: "Rezé", harvesters_number: 1})
partner_07 = Partner.create({brand: intermarche, name: "Intermarché Chantenay", address: "32 Rue de la Marseillaise", zipcode: "44100", city: "Nantes", harvesters_number: 2})
partner_08 = Partner.create({brand: intermarche, name: "Intermaché Eraudière", address: "173 Route de Saint-Joseph", zipcode: "44300", city: "Nantes", harvesters_number: 2})
partner_09 = Partner.create({brand: boulangerie_augustin, name: "Augustin Beaujoire", address: "1 Boulevard de la Beaujoire", zipcode: "44300", city: "Nantes", harvesters_number: 1})
partner_10 = Partner.create({brand: systeme_u, name: "Super U PT St Martin", address: "Rue des Vignes", zipcode: "44860", city: "Pont Saint Martin", harvesters_number: 2})
partner_11 = Partner.create({brand: systeme_u, name: "Super U St Philbert de grandlieu", address: "Chemin de la Plage", zipcode: "44310", city: "Saint-Philbert-de-Grand-Lieu", harvesters_number: 2})
partner_12 = Partner.create({brand: systeme_u, name: "Super U Bouaye", address: "53 Rue de Nantes", zipcode: "44830", city: "Bouaye", harvesters_number: 2})
partner_13 = Partner.create({brand: systeme_u, name: "Super U Sainte-Pazanne", address: "Rue des Charmes", zipcode: "44680", city: "Sainte-Pazanne", harvesters_number: 2})
partner_14 = Partner.create({brand: potager_city, name: "Potager City Les Sorinières", address: "1 B Rue Du Progres", zipcode: "44840", city: "LES SORINIERES", harvesters_number: 1})
puts "End of Adding Partners"
