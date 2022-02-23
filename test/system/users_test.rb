require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
   test "Global Test" do
     visit landingpage_path
     click_on('Se connecter')
     assert_title("DLC - Détournement Libre de Consommables")

     sleep(1)
     within('form') do
     fill_in "user_email" , with: "axel@dlc.org"
     fill_in "user_password" , with: "azerty"
     end

     click_button('Valider')
     sleep(1)
     assert_text("JE CHOISIS UN MAGASIN")
     find('#shops-map-tab').click
     sleep(1)
     find('#shops-list-tab').click
     sleep(1)
     click_on('urgent', match: :first)
     sleep(1)
     assert_text("PROCHAINES RÉCOLTES")
     sleep(1)

     find('.register', match: :first).click
     sleep(1)
     assert_text("Confirmez votre inscription pour la récolte :")
     click_on("Oui")
     sleep(1)
     assert_text("Vous Participez")
     find('.cancel', match: :first).click
     sleep(1)
     assert_text("Souhaitez-vous vous désinscrire pour la récolte :")
     click_on('Oui')
     sleep(1)
     assert_text("0/2 Participants")
     find('#heart-fav').click
     sleep(2)

     click_on('Favoris')
     sleep(1)
     assert_text("MES MAGASINS FAVORIS")
     find('#cross').click
     sleep(1)
     click_on('Distributions')
     sleep(2)
     assert_text("J'ORGANISE MA DISTRIBUTION")

     click_on('Urgences')
     sleep(1)
     assert_text("LES RÉCOLTES URGENTES")
     find("#register", match: :first).click
     sleep(1)
     assert_text("Confirmez votre inscription pour la récolte :")
     click_on('Oui')
     sleep(1)

     click_on('Profil')
     sleep(1)
     assert_text("MON PROFIL")

     find('#planning').click
     sleep(1)
     find('#crossdeleteplanning', match: :first).click
     sleep(1)
     assert_text("Souhaitez-vous vous désinscrire pour la récolte :")
     click_on("Oui")
     sleep(1)
     find('#planning').click

     find('#distributions').click
     assert_text("EN COURS")

     find('#coordonees').click
     assert_text("Prénom")

     find('#planning').click
     find('#distributions').click
     find('#coordonees').click

     click_on('Support technique')
     sleep(1)
     assert_text("MERCI !")

     go_back
     sleep(1)
     assert_text("MON PROFIL")

     click_on('Déconnexion')
     sleep(1)
     assert_text("Déconnecté(e).")

   end
end
