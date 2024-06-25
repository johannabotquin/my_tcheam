import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress"
export default class extends Controller {
  static values = {
    score: Number,
    goal: Number
  }

  static targets = ["circle"]

  connect() {
    const score = this.scoreValue;
    const goal = this.goalValue;

    console.log(`Score: ${score}`);
    console.log(`Goal: ${goal}`);

    const circle = this.circleTarget;
    const radius = circle.r.baseVal.value;
    const circumference = 2 * Math.PI * radius;

    circle.style.strokeDasharray = `${circumference}`;
    let progress = (score / goal) * 100;
    let offset = circumference - (progress / 100) * circumference;

    circle.style.transition = 'stroke-dashoffset 1s ease-in-out';
    circle.style.strokeDashoffset = circumference;

    setTimeout(() => {
      circle.style.strokeDashoffset = offset;
    }, 100);
  }
}
