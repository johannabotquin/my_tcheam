import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="list-update"
export default class extends Controller {

  static targets = ["content", "lists"]
  connect() {
    console.log('kikou')
  }

  updateList() {
    const stringContent = this.contentTarget.innerText;

    const list = {
      content: stringContent
    };


    const listId = this.contentTarget.getAttribute('data-list-id')
    const userId = this.contentTarget.getAttribute('data-user-id')
    const url = `/users/${userId}/lists/${listId}`
    const csrfToken = document.querySelector("[name='csrf-token']").getAttribute("content");


    fetch(url, {
      method: 'PATCH',
      headers: {
        "Accept": "text/plain",
        "Content-Type": "application/json",
        "X-CSRF-Token": csrfToken,// Ajout du token d'authenticité dans les en-têtes
      },
      body: JSON.stringify({list: list})
    })
    .then(response => response.text())
    .then((data) => {
      this.listTargets.outerHTML = data
    });
  }
}
