import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dispatch"
export default class extends Controller {

  static targets = [ "card" ]
  connect() {
    console.log("Connected to dispatch controller")
  }

  dispatch(event) {
    event.preventDefault()
    console.log(this.cardTargets)
    this.cardTargets.forEach((card) => {
      console.log(card)
      card.classList.remove("d-none")
    })
  }
}
