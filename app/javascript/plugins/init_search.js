const initSearch = () => {
  const searchButton = document.getElementById("search");
  if (searchButton) {
    searchButton.addEventListener('click', () => {
      const place = document.getElementById("place").innerText;
      const result = Geocoder.search(place);
      // console.log(initMapbox.geocoder);
    });
  }
};

export { initSearch };

