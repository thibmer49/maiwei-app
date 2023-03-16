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

    const windowHeight = window.innerHeight;
    const windowWidth = window.innerWidth;

    const initialTop = windowHeight * 0.609;
    const initialLeft = -plane.clientWidth;

    const finalTop = windowHeight * 0.6;
    const finalLeft = windowWidth;

    const duration = 20000;

    let progress = 0;
    let lastDash = 0;

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

        if (left > windowWidth * 0.75 - 60) {
          plane.style.zIndex = "2"; // Avion et tracé derrière la dernière carte
          path.style.zIndex = "2";
        } else if (left > windowWidth * 0.5 - 30) {
          plane.style.zIndex = "0"; // Avion et tracé devant la dernière carte
          path.style.zIndex = "0";
        } else if (left > windowWidth * 0.25 - 30) {
          plane.style.zIndex = "2"; // Avion et tracé derrière la dernière carte
          path.style.zIndex = "2";
        } else {
          plane.style.zIndex = "0"; // Avion et tracé devant la dernière carte
          path.style.zIndex = "0";
        }

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
