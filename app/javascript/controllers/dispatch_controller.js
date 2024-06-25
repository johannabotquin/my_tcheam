import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dispatch"
export default class extends Controller {

  static targets = [ "card", "avatar" ]
  connect() {
    console.log("Connected to dispatch controller")
  }

  dispatch(event) {
     this.cardTargets.forEach((card, index) => {
      // Utilise setTimeout pour décaler l'ajout de la classe
      setTimeout(() => {
        card.classList.add("flip-this-card");
      }, index * 500); // Décale de 500ms pour chaque carte
    });

    setTimeout(() => {
      this.avatarTargets.forEach((avatar, index) => {
        // Utilise setTimeout pour décaler l'ajout de la classe
            setTimeout(() => {
              avatar.classList.remove("d-none");
            }, index * 500); // Décale de 500ms pour chaque carte
          })
    }, 500);
  }

}
