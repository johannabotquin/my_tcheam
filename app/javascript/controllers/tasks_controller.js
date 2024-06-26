// tasks_controller.js

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["date"];

  connect() {
    console.log("Tasks controller connected");
    this.filterDefaultDate();
  }

  filterDefaultDate() {
    const defaultRadioButton = this.dateTargets.find(radio => radio.checked);
    if (defaultRadioButton) {
      this.filterTasks({ target: defaultRadioButton });
    }
  }

  filterTasks(event) {
    const date = event.target.value;
    const url = `/tasks?filter[date]=${date}`;
    console.log(url);

    fetch(url, {
      headers: {
        "Accept": "text/html",
        "X-Requested-With": "XMLHttpRequest"
      }
    })
    .then(response => response.text())
    .then(html => {
      document.querySelector("#tasks-list").innerHTML = html;
    })
    .catch(error => console.error('Error fetching tasks:', error));
  }

}
