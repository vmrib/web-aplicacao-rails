import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="alert"
export default class extends Controller {
  fadeOut() {
    setTimeout(() => {
      $(this.element).fadeOut();
    }, 3000);
  }
}
