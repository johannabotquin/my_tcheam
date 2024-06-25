import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cagagne"
export default class extends Controller {
  static targets = ["alert", "audio"]
  connect() {

    console.log(this.alertTarget);
    console.log(this.alertTarget.innerHTML);
  }

  win() {
      this.audioTarget.play();
      this.hideAlert();
    }

  hideAlert() {
    this.alertTarget.classList.remove('show')
    setTimeout(() => {
      this.alertTarget.remove()
    }, 2000)
  }
}
