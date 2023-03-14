import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  static targets = ["list"]

  connect() {
    this.token = document.querySelector('meta[name="csrf-token"]').content
    console.log(this.token)

    const lists = this.listTargets;
    lists.forEach((list) => {
      Sortable.create(list, {
        group: 'shared',
        animation: 150,
        draggable: ".card-trip-show",
        onEnd: (event) => {
          // 1. Je dois trouver la date dans laquelle la carte est droppée
            const date = event.to.dataset.date;
            console.log(event);
            const url = `${event.item.dataset.url}?date=${date}`;
          // 2. Je fetch
          console.log(url)
          fetch(url, {
            method: "PATCH",
            headers: { "X-CSRF-TOKEN": this.token }
          })
            .then(response => response.text())
            .then((data) => {
              console.log(data)
            })

          // 3. J'enlève le callout
            // document.addEventListener('change', (event) => {
            //   const callout = document.querySelector('.callout')
            //   callout.classList.remove("callout");
            // })
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
