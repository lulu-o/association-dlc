const initModal = () => {
  const modalWindow = document.getElementById("modal-window");
  if (modalWindow) {



    // Eléments de la modale (message, nom du magasin, date, boutons)
    const introTag = document.getElementById("intro-text");
    const modalShop = document.getElementById("modal-shop");
    const modalSchedule = document.getElementById("modal-schedule");
    const cancelButton = document.getElementById("modal-cancel");
    const confirmButton = document.getElementById("modal-confirm");
    //Tous les boutons d'action des dates
    const buttons = document.querySelectorAll(".date-action > div");

    buttons.forEach((button) => {

      button.addEventListener('click', () => {
        const shop = button.dataset.shop;
        const date = button.dataset.date;
        const url = button.dataset.url;
        const method = button.dataset.method;
        if (button.classList.contains('label-yellow') == false) {
          button.classList.add('pop');
        }
        modalWindow.classList.add("z10");

        // Vérifier la classe css du bouton pour afficher le bon message
        if (button.classList.contains('cancel')) {
            introTag.innerText = "Souhaitez-vous vous désinscrire pour la récolte :";
        } else {
            introTag.innerText = "Confirmez votre inscription pour la récolte :";
        }
        confirmButton.setAttribute("data-method", method);
        confirmButton.setAttribute("href", url);
        // Insérer les données magasin + date
        modalShop.innerText = shop;
        modalSchedule.innerText = date;
        // Fermer la modale et rétablir l'état du bouton de la date
        setTimeout(() => {
          button.classList.remove('pop');
          modalWindow.classList.remove("transparent");
        }, 500);
      });
    });


    // Au clic sur Annuler, masquer la modale
    cancelButton.addEventListener('click', () => {
      cancelButton.classList.add("revert-red");
      modalWindow.classList.add("transparent");

      setTimeout(() => {
        modalWindow.classList.remove("z10");
        cancelButton.classList.remove("revert-red");
      }, 500);
    });

    // Au clic sur Confirmer, inscrire le user (à terminer)
    confirmButton.addEventListener('click', () => {
      confirmButton.classList.add("revert-green");
      modalWindow.classList.add("transparent");
      setTimeout(() => {
        modalWindow.classList.remove("z10");
        confirmButton.classList.remove("revert-green");
      }, 500);
    });
  }

};

export { initModal };
