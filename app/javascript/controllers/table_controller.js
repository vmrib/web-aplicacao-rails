import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="table"
export default class extends Controller {
  show() {
    console.log("Hello, Stimulus!", this.element);
  }

  show2() {
    console.log("Hello, Stimulus!", this.element);
  }
}
