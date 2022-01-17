import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["hamburger", "navigation"]

  toggle() {
    this.hamburgerTarget.classList.toggle("hamburger--activated")
    this.navigationTarget.classList.toggle("navigation--visible")
  }
}
