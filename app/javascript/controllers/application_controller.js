// app/javascript/controllers/application_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Application controller connected")
  }

  log(message) {
    console.log(`[LOG] ${message}`)
  }
}
