const initModal = () => {
  const modalWindow = document.getElementById("modal-window");
  if (modalWindow) {
    const buttons = document.querySelectorAll(".date-action > div");
    // ELEMENTS TEXTE DE LA MODALE
    let modalShop = document.getElementById("modal-shop");
    let modalSchedule = document.getElementById("modal-schedule");
    const cancelButton = document.getElementById("modal-cancel");

    buttons.forEach((button) => {
      button.addEventListener('click', () => {
        button.classList.add('pop');
        modalWindow.classList.add("z10");
        const shop = document.getElementById("partner-name").innerText;
        const date = button.parentElement.parentElement.querySelector('.date').innerText;
        modalShop.innerText = shop;
        modalSchedule.innerText = date;
        setTimeout(() => {
          button.classList.remove('pop');
          modalWindow.classList.remove("transparent");
        }, 500);
      });
    });

    cancelButton.addEventListener('click', () => {
      modalWindow.classList.add("transparent");
      setTimeout(() => {
        modalWindow.classList.remove("z10");
      }, 1000);
    });
  }

};

export { initModal };
