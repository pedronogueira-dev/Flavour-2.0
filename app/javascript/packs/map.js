import 'mapbox-gl/dist/mapbox-gl.css'
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';

const mapElement = document.getElementById('map');

if (mapElement) { // only build a map if there's a div#map to inject into
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v9'
  });

  const marker = JSON.parse(mapElement.dataset.marker);
  new mapboxgl.Marker()
    .setLngLat([marker.lng, marker.lat])
    .addTo(map);

    map.setZoom(12);
    map.setCenter([marker.lng, marker.lat]);
}
