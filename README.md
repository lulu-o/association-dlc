### **Initialisation du Projet :** 

_`ruby .\bin\bundle install`_

puis

_`ruby .\bin\bundle update`_
<br>
### **Initialisation de la Base de Données :**

- Créer les BDD sous postgresql au nom de :
_'association_dlc_development'_
et 
_'association_dlc_test'_ 


- Ajoutez vos identifications des BDD dans le fichier `database.yml` : 
    
      default: &default
        adapter: postgresql
        encoding: unicode
        Username : *MonIdentifiant*
        Password : *MonMotDePasse*
- Effectuer les commandes suivantes : 

`ruby .\bin\rails db:migrate `

puis

`ruby .\bin\rails db:seed `

et enfin pour la BDD de test 

`ruby .\bin\rake db:seed RAILS_ENV=test`

### **Lancer l'application :**

`ruby .\bin\rails server`

<br> 
-------------------



















Fonctionnement Recherche

Affichage du formulaire :
Par défaut, le formulaire affiche l'adresse du user et un rayon de 5km
Les deux champs sont obligatoires et le submit ne se produira que s'ils sont renseignés

Géoloc :
Au clic sur le marker position, le champ adresse affiche "ma position" tandis que les coordonnées sont stockées dans l'attribut data-coords du champ
L'attribut data-search-type, qui est "text" par défaut est modifié pour préciser le contexte géoloc
Au moment du submit, on récupère l'attribut data-coords pour le passer en paramètre

Résultats - Cas identifiés
Au premier affichage, aucun param n'est passé. On affiche donc arbitrairement l'adresse du user avec un rayon de 10 km.
