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

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initModal();
  const searchButton = document.getElementById("search");
  if (searchButton) {
    searchButton.addEventListener('click', () => {
      const place = document.getElementById("place").innerText;
      const result = Geocoder.search(place);
      // console.log(initMapbox.geocoder);
    });
  }

});
