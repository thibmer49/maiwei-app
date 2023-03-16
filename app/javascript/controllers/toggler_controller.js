import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggler"
export default class extends Controller {
  static targets = ["map", "tripProgramme"]
  connect() {

  }

  toggleMap(event) {
    this.mapTarget.classList.toggle("active");
    this.tripProgrammeTarget.classList.toggle("active");
    this.mapTarget.style.width = "100vw !important";
  }
}
