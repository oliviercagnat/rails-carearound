
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['hidden']

  // dont forget the ; => it wouldnt connect without them

  connect() {
    this.hiddenTarget.style.height = 0;
    this.hiddenTarget.style.overflow = 'hidden';
    this.hiddenTarget.style.transition = 'height 500ms ease-out';
  }

  // action

  expand(event) {
    event.target.display = 'none';
    this.hiddenTarget.style.height = '150px';
    event.target.classList.add("d-none");   // => Selecting the button (target) and using class list to change its CSS class to d-none
  }
}