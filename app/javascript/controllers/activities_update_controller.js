import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activities-update"
export default class extends Controller {
  static targets = [ "form", "input", "list", "checkbox"]

  connect() {
    console.log("activities-update-controller-connected!")
  }

  update() {

    const checkedInputValues = this.checkboxTargets.filter(checkbox => checkbox.checked).map(checkbox => checkbox.value);
    const city = this.inputTarget.value;
    // const formData = new FormData(this.formTarget)
    // const queryString = new URLSearchParams(formData).toString();

    const url = `${this.formTarget.dataset.url}?city=${city}&categories=${checkedInputValues}`;
    fetch(url, {
      headers: {"Accept": "text/plain"}
    })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }
}
