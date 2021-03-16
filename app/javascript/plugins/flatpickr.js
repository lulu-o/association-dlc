import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js";


const initFlatpickr = () => {
  flatpickr(".datepicker", {
    "locale": French,
    minDate: "today"
  });

  flatpickr(".timepicker", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    "locale": French,
});

}

export { initFlatpickr };