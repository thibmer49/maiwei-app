import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  static targets = ["results"]

  connect() {
    Sortable.create(this.resultsTarget, {
      ghostClass: "ghost",
      animation: 150,
      // onEnd: (event) => {
      //   alert(`${event.oldIndex} moved to ${event.newIndex}`)
      // }
    })
  }
}
