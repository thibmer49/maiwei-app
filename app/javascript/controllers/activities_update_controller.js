import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activities-update"
export default class extends Controller {
  static targets = [ "form", "input", "list"]

  connect() {
    console.log("activities-update-controller-connected!")
  }

  update() {
    event.preventDefault();
    const formData = new FormData(this.formTarget)
    const queryString = new URLSearchParams(formData).toString();

    const url = `${this.formTarget.action}?${queryString}`;
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }
}
