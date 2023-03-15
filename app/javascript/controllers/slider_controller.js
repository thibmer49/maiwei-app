import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["range", "value", "budget"];

  connect() {
    console.log("hello-from-slider")
  }

  updateValue(evt) {
    this.budgetTarget.value = evt.target.value
  }
}
