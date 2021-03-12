// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports
import { initMapbox } from '../plugins/init_mapbox';
import { initModal } from '../plugins/init_modal';
import { initSearch } from "../plugins/init_search";
import { calculateDistance } from "../plugins/calculate_distance"
import { Button } from "bootstrap"

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  calculateDistance();
  initModal();
  initSearch();
  const tabs = document.querySelectorAll('.tab');
  const tabContainers = document.querySelectorAll('.tab-container');

  if (tabs) {
    tabs.forEach((tab) => {
      tab.addEventListener('click', () => {
        tabs.forEach((element) => {element.classList.remove('active')});
        tab.classList.add('active');
        tabContainers.forEach((container) => { container.classList.remove('active') });
        const contentId = tab.id.split('-')[1];
        const activeContainer = document.getElementById(`shops-${contentId}-container`);
        activeContainer.classList.add('active');
      });
    });
  }

  const heart = document.getElementById('heart-fav');
  if (heart) {
    heart.addEventListener('click', () => {
      heart.classList.add('heartpop');
      setTimeout(() => {
        heart.classList.remove('heartpop');
      }, 400);
    });
  }

});
