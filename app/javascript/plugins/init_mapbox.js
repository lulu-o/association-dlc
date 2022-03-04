import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (!mapElement) { // only build a map if there's a div#map to inject into
    console.debug("no #map element found... nothing to do")
    return
  }

  try {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: mapElement,
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);
    markers.forEach((marker) => {
      console.log(marker);
      const element = document.createElement('i');
      element.classList.add('fas');

      if (marker.type == "position") {
        element.classList.add('fa-user-circle');
        element.style.fontSize = '26px';
        element.style.color = '#EB5855';
        element.style.backgroundColor = 'white';
        element.style.borderRadius = '50%';
        element.style.paddingBottom = '0';
        element.style.marginBottom = '5px';
      } else {
        element.classList.add('fa-map-marker-alt');
        element.style.color = '#114D4D';
        element.style.fontSize = '32px';
      }
      if (marker.i_window != "none") {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
        new mapboxgl.Marker(element)
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(map);
      } else {
        new mapboxgl.Marker(element)
          .setLngLat([marker.lng, marker.lat])
          .addTo(map);
      }
    });

    fitMapToMarkers(map, markers);

    const geocoder = new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    });
  } catch (e) {
    console.error("probleme map, car : " + e)
  }
};

export { initMapbox };
