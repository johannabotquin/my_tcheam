import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dispatch"
export default class extends Controller {

  static targets = [ "card", "faceB" ]
  connect() {
    console.log("Connected to dispatch controller")
  }

  dispatch(event) {
    event.preventDefault();
    console.log(this.cardTargets);
    this.cardTargets.forEach((card, index) => {
      // Utilise setTimeout pour décaler l'ajout de la classe
      setTimeout(() => {
        console.log(card);
        card.classList.add("flip-this-card");
      }, index * 500); // Décale de 500ms pour chaque carte
    });
}
}
