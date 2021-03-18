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
import { initSearch } from "../plugins/init_search";
import { initModal } from '../plugins/init_modal';
import { tabs } from "../plugins/tabs";
import { favs } from "../plugins/heart";
import { Button } from "bootstrap";
import { initFlatpickr } from "../plugins/flatpickr";
import { hideFlash } from "../plugins/hide_flash"

document.addEventListener('turbolinks:load', () => {
  initFlatpickr();
  initMapbox();
  initSearch();
  initModal();
  tabs();
  favs();
  hideFlash();

});
