import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timeline-update"
export default class extends Controller {
  static targets = ["time", "activity"]

  connect() {
    // console.log(this.timeTarget)
    // console.log(this.activityTarget)
    this.token = document.querySelector('meta[name="csrf-token"]').content
  }

  update(event) {
    const url = `${event.item.dataset.url}?date=${date}`;
    const times = this.timeTargets
    event.preventDefault()
    // times.forEach((time) =>
    console.log(url)

    fetch(url, {
      method: "PATCH",
      headers: { "X-CSRF-TOKEN": this.token }
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
      })
  }
}
