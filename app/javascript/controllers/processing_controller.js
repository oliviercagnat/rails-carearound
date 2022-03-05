import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['processingPage', 'spinner']

  connect(){
    console.log("hello");
  }

  loading(event) {
    console.log(event);
    event.preventDefault();
    this.spinnerTarget.classList.toggle("d-none");
    setTimeout(() => {
      window.location.href = event.target.href
    }, 2500);
  }

  // kill spinner (hide / d-none)

}
