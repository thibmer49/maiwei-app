import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["range", "value"];

  connect() {
    this.updateValue();
    this.positionValueElement();
    console.log("hello-from-slider")
  }

  updateValue() {
    const currentValue = parseInt(this.rangeTarget.value);
    this.valueTarget.innerText = `${currentValue}€`;
    this.positionValueElement();
  }

  positionValueElement() {
    const range = this.rangeTarget;
    const rangeWidth = range.clientWidth;
    const min = parseInt(range.min);
    const max = parseInt(range.max);
    const currentValue = parseInt(range.value);
    const position = ((currentValue - min) / (max - min)) * rangeWidth;

    this.valueTarget.style.left = `calc(${position}px - 3%)`;

  }
}
