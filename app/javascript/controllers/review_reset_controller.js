import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['reset']

reset() {
  this.resetTarget.classList.reset();
};

};
