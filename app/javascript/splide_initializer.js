export default function initializeSplideCarousel() {
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
