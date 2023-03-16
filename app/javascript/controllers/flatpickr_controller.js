import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Import the rangePlugin from the flatpickr library
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startingDate", "endingDate" ]
  connect() {
    flatpickr(this.startingDateTarget, {
      enableDate: true,
      altInput: true,
      altFormat: "j F, Y",
      dateFormat: "Y-m-d",
      minDate: "today",

      // Provide an id for the plugin to work
      plugins: [new rangePlugin({ input: "#ending_date"})]})
    flatpickr(this.endingDateTarget, {
      enableDate: true,
      altFormat: "j F, Y",
      dateFormat: "Y-m-d",
    })
    }
  }
