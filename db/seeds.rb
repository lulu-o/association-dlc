puts "Cleaning Brands"
Brand.destroy_all
puts "Cleaning Associations"
Association.destroy_all


Brand.create!([
  {name: "Carrefour", logo: "https://e7.pngegg.com/pngimages/592/86/png-clipart-carrefour-online-marketing-business-hypermarket-marketing-text-retail.png"},
  {name: "Systeme U", logo: "https://img2.freepng.fr/20180713/xfo/kisspng-systme-u-supermarket-hypermarket-super-u-et-driv-logo-bea-cukai-5b488a12a2a167.7599448815314805946662.jpg"}
])
Association.create!([
  {name: "Association DLC", address: "16 Rue Malherbe", zipcode: "44000", city: "NANTES", latitude: 47.2178075, longitude: -1.5477781}
])
