import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "results"];

  connect() {
    console.log('connected')
  }

  filter(event) {
    event.preventDefault();
    console.log('filtering');

    const url = this.formTarget.action;
    const formData = new FormData(this.formTarget);

    fetch(url, {
      method: 'GET',
      headers: {
        "Accept": "text/plain"
      },
      body: formData
    })
    .then(response => response.text())
    .then(data => {
      this.resultsTarget.innerHTML = data;
    })
  }
}
