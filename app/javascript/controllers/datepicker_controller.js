import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr"; // Vous devez importer cela pour utiliser flatpickr

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      minDate: "today" // Désactive les dates passées
    });
  }
}
