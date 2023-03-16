import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  static targets = ["map", "tripProgramme"]

  connect() {

  }

  loadMap() {
    this.mapTarget.classList.toggle("active");
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/mapbox/streets-v10",
      trackResize: false
    })

    this.tripProgrammeTarget.classList.toggle("active");

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup({
        closeButton: false,
        className: 'trip-activity-popup',
        maxWidth: '400px',
        anchor: 'left'
      }).setHTML(marker.info_window_html)
      new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
