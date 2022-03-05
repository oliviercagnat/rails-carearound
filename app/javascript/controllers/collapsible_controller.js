
import { Controller } from "stimulus";

export default class extends Controller {  // This contoller class will allow you to connect to the data controller in the HTML
  static targets = ['hidden'] // The "hidden" static target is the target that you put in the HTML

  collapse() {
   $("#reviewModal").modal("hide"); // Because modals use JQERY it is needed to hide the form => By doing this the form will close and you can still scroll
  };
};
