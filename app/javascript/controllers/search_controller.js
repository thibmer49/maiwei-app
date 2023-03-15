import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["cta", "input"]

  connect() {
    this.search()
  }

  search() {
    this.ctaTarget.href = `/trips/new?query=${this.inputTarget.value}`
  }
}
