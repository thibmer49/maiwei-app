// app/javascript/controllers/homepage_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["plane", "path"];

  connect() {
    this.animatePlane();
  }

  animatePlane() {
    const plane = this.planeTarget;
    const path = this.pathTarget;
    const dashedLine = document.createElement("div");
    dashedLine.classList.add("dashed-line");

    path.appendChild(dashedLine);

    const windowHeight = window.innerHeight;
    const windowWidth = window.innerWidth;

    const initialTop = windowHeight * 0.5;
    const initialLeft = -plane.clientWidth;

    const finalTop = windowHeight * 0.7;
    const finalLeft = windowWidth;

    const duration = 10000;

    let progress = 0;

    path.style.top = `${initialTop}px`;

    const easeInOutQuad = (t) => {
      return t < 0.5 ? 2 * t * t : -1 + (4 - 2 * t) * t;
    };

    const updateAnimation = () => {
      progress += 1 / (duration / 16.6666666667);

      if (progress < 1) {
        const easedProgress = easeInOutQuad(progress);

        const top = initialTop + (finalTop - initialTop) * easedProgress;
        const left = initialLeft + (finalLeft - initialLeft) * easedProgress;

        plane.style.top = `${top}px`;
        plane.style.left = `${left}px`;

        // Animer le tracé en pointillés
        dashedLine.style.left = `${left - 100}px`;
        dashedLine.style.width = `${left + 100}px`;

        requestAnimationFrame(updateAnimation);
      } else {
        plane.style.top = `${initialTop}px`;
        plane.style.left = `${initialLeft}px`;

        progress = 0;
        requestAnimationFrame(updateAnimation);
      }
    };

    updateAnimation();
  }
}
