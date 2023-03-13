import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  static targets = ["list"]

  connect() {
    const lists = this.listTargets;
    lists.forEach((list) => {
      Sortable.create(list, {
        group: 'shared',
        animation: 150,
        draggable: ".card-trip-show",
        onEnd: (event) => {
          // 1. Je dois trouver la date dans laquelle la carte est droppée
          // 2. Je fetch la trip_activity_trip_activity_path
          // 3. J'enlève le callout
        }
      })


      // Sortable.create(this.resultsTarget, {
      //   ghostClass: "ghost",
      //   animation: 150,
      //   // onEnd: (event) => {
      //   //   alert(`${event.oldIndex} moved to ${event.newIndex}`)
      //   // }
      // })

    })
  }
}
