import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["photo", "checkbox"]

  connect() {
    this.photoTargets.forEach(photo => {
      photo.addEventListener('click', this.toggleSelection.bind(this))
    })
  }

  toggleSelection(event) {
    const photo = event.currentTarget
    const userId = photo.dataset.memberId
    const checkbox = this.checkboxTargets.find(checkbox => checkbox.value === userId)

    if (checkbox) {
      if (photo.classList.contains('selected')) {
        photo.classList.remove('selected')
        checkbox.disabled = true
        checkbox.removeAttribute('name')
      } else {
        photo.classList.add('selected')
        checkbox.disabled = false
        checkbox.setAttribute('name', 'task[task_managers_attributes][][user_id]')
      }
    }
  }
}
