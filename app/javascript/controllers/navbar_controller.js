import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = [ "menu", "close" ]
  connect() {
    console.log("Hello, Stimulus!")
  }

  toggle() {
    this.menuTarget.classList.toggle('d-none')
    this.closeTarget.classList.toggle('d-none')
  }
}
