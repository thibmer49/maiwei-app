import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  static targets = ["list", "dayTripList"]

  connect() {
    this.token = document.querySelector('meta[name="csrf-token"]').content
    // console.log(this.token)
  }

  listTargetConnected(list) {
    // console.log("sortable connected!")

    Sortable.create(list, {
      group: 'shared',
      animation: 150,
      draggable: ".card-trip-wrapper",
      onEnd: (event) => {
        // 1. Je dois trouver la date dans laquelle la carte est droppée
          const date = event.to.dataset.date;
          console.log(event);
          const url = `${event.item.dataset.url}?date=${date}`;
        // 2. Je fetch
        console.log(url)
        fetch(url, {
          method: "PATCH",
          headers: {
            "X-CSRF-TOKEN": this.token,
            "Accept": "text/plain"
          }
        })
          .then(response => response.text())
          .then((data) => {
            // console.log(data)

            this.dayTripListTarget.innerHTML = data
          })

        // 3. J'enlève le callout
          // document.addEventListener('change', (event) => {
          //   const callout = document.querySelector('.callout')
          //   callout.classList.remove("callout");
          // })
      }
    })
  }
}
