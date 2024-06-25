import { Controller } from "@hotwired/stimulus";
export default class extends Controller {
  static targets = ["date", "usertasks"];

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
    const url = `/teams/${this.element.dataset.teamId}?filter[date]=${date}`;
    console.log(url);

    fetch(url, {
      headers: {
        "Accept": "application/json",
        "X-Requested-With": "XMLHttpRequest"
      }
    })
    .then(response => {
      return response.json();
    })
    .then(data => {
      console.log(data);
      data.tasks.forEach(taskData => {
        const usertasksTarget = this.targets.find(`usertasks-${taskData.user_id}`);
        console.log(usertasksTarget);
        if (usertasksTarget) {
          usertasksTarget.innerHTML = taskData.html;
        }
      });
    })
    .catch(error => console.error('Error fetching tasks:', error));
  }
}
