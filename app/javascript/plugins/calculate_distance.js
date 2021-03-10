const calculateDistance = () => {
  const searchBar = document.getElementById("geo-search");
  if (searchBar) {
    const myCoords = [parseFloat(searchBar.getAttribute('lat')), parseFloat(searchBar.getAttribute('lng'))]
    const coords = document.querySelectorAll(".distance-label");
    coords.forEach((coord) => {
      const distanceTag = coord.lastElementChild;
      const coordinates = [parseFloat(coord.getAttribute('lat')), parseFloat(coord.getAttribute('lng'))];
      const distance = turf.distance(myCoords, coordinates, { units: 'kilometers' }).toFixed(2);
      distanceTag.innerText = `${distance} km`;
    });
  }
}

export { calculateDistance };
