import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['list']

  connect() {
    // const reviewsList = document.getElementById("reviews-id")
    // reviewsList.classList.add("reveal")

    // const ingredientsList = document.getElementById("ingredient-id")
    // console.log(this);
    this.listTarget.classList.add("reveal")
    }

  // action

  expand() {
    this.listTarget.classList.toggle("reveal") // Because it was used as a SCSS class I could toggle it
  }

  // expandIngredient() {
  //   this.ingredientsTarget.classList.toggle("reveal")
  // }

}
