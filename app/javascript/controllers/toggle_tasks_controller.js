import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["taskList"]

  toggle(event) {
    const userId = event.target.dataset.userId;
    const taskList = this.taskListTargets.find(element => element.dataset.userId == userId);

    if (taskList) {
      taskList.classList.toggle("d-none");
    }
  }
};
