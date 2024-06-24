import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="winaudio"
export default class extends Controller {
  static targets = ["reward"]
  connect(event) {
    const reward = parseInt(this.rewardTarget.innerHTML, 10)
    const audio = new Audio('app/assets/images/coin.mp3');
      audio.play();
  }
}
