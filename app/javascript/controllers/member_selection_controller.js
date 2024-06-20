import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["photo", "checkbox"]

  connect() {
    console.log('MemberSelectionController connected');
    this.photoTargets.forEach(photo => {
      photo.addEventListener('click', this.toggleSelection.bind(this))
    })
  }

  toggleSelection(event) {
    const photo = event.currentTarget
    console.log('Photo :', photo);
    const userId = photo.dataset.memberId
    console.log('User ID :', userId);
    const checkbox = this.checkboxTargets.find(checkbox => checkbox.value === userId)
    console.log('Checkbox :', checkbox);

    if (checkbox) {
      if (photo.classList.contains('selected')) {
        photo.classList.remove('selected')
        checkbox.disabled = true
        checkbox.removeAttribute('name')
      } else {
        photo.classList.add('selected')
        checkbox.disabled = false
        checkbox.setAttribute('name', 'task[members][][user_id]')
      }
    }
  }
}
