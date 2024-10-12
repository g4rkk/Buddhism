// app/javascript/controllers/meditation_player_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "timer" ]

  connect() {
    this.sessionStartTime = null
    this.timerInterval = null
  }

  startSession() {
    this.sessionStartTime = new Date()
    this.timerInterval = setInterval(() => this.updateTimer(), 1000)
    this.element.querySelector('button[data-action="click->meditation-player#startSession"]').style.display = 'none'
    this.element.querySelector('button[data-action="click->meditation-player#endSession"]').style.display = 'inline'
  }

  endSession() {
    if (this.sessionStartTime) {
      clearInterval(this.timerInterval)
      const duration = Math.round((new Date() - this.sessionStartTime) / 1000)
      this.createMeditationSession(duration)
      this.sessionStartTime = null
      this.element.querySelector('button[data-action="click->meditation-player#startSession"]').style.display = 'inline'
      this.element.querySelector('button[data-action="click->meditation-player#endSession"]').style.display = 'none'
    }
  }

  updateTimer() {
    if (this.sessionStartTime) {
      const duration = Math.round((new Date() - this.sessionStartTime) / 1000)
      const minutes = Math.floor(duration / 60)
      const seconds = duration % 60
      this.timerTarget.textContent = `${minutes}:${seconds.toString().padStart(2, '0')}`
    }
  }

  createMeditationSession(duration) {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    fetch('/meditation_sessions', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({
        meditation_session: {
          meditation_guide_id: this.element.dataset.meditationPlayerGuideId,
          duration_seconds: duration
        }
      })
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        alert('瞑想セッションが記録されました。')
      } else {
        alert('エラーが発生しました。')
      }
    })
  }
}