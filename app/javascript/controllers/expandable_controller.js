import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['reviews']
  connect() {
    this.reviewsTarget.classList.add("reveal") // Saved this into a new SCSS class for the button and then targeted
  }

  // action

  expand() {
    this.reviewsTarget.classList.toggle("reveal") // Because it was used as a SCSS class I could toggle it
  }

}
