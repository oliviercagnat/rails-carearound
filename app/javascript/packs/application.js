// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
// Internal imports, e.g:
//import 'jquery'
//import 'select2'

import { initCosmeImage } from '../components/camera';



import { initStarRating } from '../plugins/init_star_rating';


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  //$(document).ready(function () {
    //$('.js-example-basic-multiple').select2();
    // });
    //console.log("hello")
  if (document.querySelector('.image-video')) {
    initCosmeImage();
  }
    initStarRating();  // => You have to put hte function inside tubolinks or it wont load until the page has been reloded (AJAX)
});

import "controllers"
