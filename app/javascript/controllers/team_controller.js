import { Controller } from "@hotwired/stimulus";
export default class extends Controller {
  static targets = ["date", "usertasks"];

  connect() {
    console.log("Tasks controller connected");
    this.filterDefaultDate();
    this.initializeSplideCarousel();
    console.log("Splide carousel initialized");
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

  initializeSplideCarousel() {
    console.log("Initializing Splide carousel")
    const splideElement = document.getElementById('date-carousel');
    if (!splideElement) {
      console.error('Splide element not found');
      return;
    }

    const todayIndex = parseInt(splideElement.getAttribute('data-today-index'), 10);
    const visibleSlides = 7;
    const centerIndex = Math.floor(visibleSlides / 2) - 1;

    const splide = new Splide(splideElement, {
      type: 'slide',
      perPage: visibleSlides,
      height: 110,
      gap: '1rem',
      pagination: false,
      breakpoints: {
        600: {
          perPage: 3,
        },
        480: {
          perPage: 5,
        },
      },
      rewind: true,
      rewindSpeed: 600,
      drag: true,
      arrows: false,
    });

    splide.on('mounted', function () {
      console.log('Splide mounted');
      if (!isNaN(todayIndex)) {
        console.log('Navigating to todayIndex:', todayIndex);
        splide.go(todayIndex - centerIndex);
      } else {
        console.error('Invalid todayIndex:', todayIndex);
      }
    });

    splide.mount();

    document.querySelectorAll('.tag-selector').forEach(radioButton => {
      radioButton.addEventListener('change', function (event) {
        const selectedDate = event.target.value;
        const selectedIndex = [...splideElement.querySelectorAll('.tag-item')].findIndex(item => item.dataset.date === selectedDate);
        if (selectedIndex !== -1) {
          splide.go(selectedIndex - centerIndex);
        }
      });
    });
  }
}
