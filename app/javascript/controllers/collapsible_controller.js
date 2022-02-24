
import { Controller } from "stimulus";

export default class extends Controller {  // This contoller class will allow you to connect to the data controller in the HTML
  static targets = ['hidden'] // The "hidden" static target is the target that you put in the HTML

  collapse() {
    this.hiddenTarget.classList.add("d-none"); // this will select the element, target the dom, and add a d-none bootstrap class to hide the form
  };
};

// dont forget the ; => it wouldnt connect without them

// connect() {
//   this.hiddenTarget.style.height = 0;
//   this.hiddenTarget.style.overflow = 'hidden';
//   this.hiddenTarget.style.transition = 'height 500ms ease-out';
// }

// // action

// expand(event) {
//   event.target.display = 'none';
//   this.hiddenTarget.style.height = "100%"; // => This is causing issues (It wont let the whole form show)
//   event.target.classList.add("d-none");   // => Selecting the button (target) and using class list to change its CSS class to d-none
// }
