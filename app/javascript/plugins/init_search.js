const initSearch = () => {
  const searchForm = document.getElementById("geo-search");

  // GEOLOC : Afficher "ma position" dans le formulaire et remplacer par les coordonnées au moment du submit
  if (searchForm) {
    const place = document.getElementById("place");
    const searchType = document.getElementById("search-type");
    const locationLink = document.getElementById("geoloc");
    // const submit = document.getElementById("search-submit");

    locationLink.addEventListener('click', (event) => {
      event.preventDefault();
      navigator.geolocation.getCurrentPosition((data) => {
        const currentPosition = [data.coords.latitude, data.coords.longitude];
        place.value = "Ma position";
        place.setAttribute("data-coords", currentPosition);
        searchType.value = "geolocation";
      });
    });

    searchForm.addEventListener('submit', (event) => {
      if (searchType.value === "geolocation") {
        const locationData = place.getAttribute("data-coords");
        place.value = locationData;
      }
    });

    place.addEventListener('keyup', () => {
      searchType.value = "text";
    });
  }
};

export { initSearch };

