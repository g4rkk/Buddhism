import { Controller } from "stimulus"
import Chart from 'chart.js/auto';

export default class extends Controller {
  static targets = ["chart"]

  connect() {
    const data = this.element.dataset.meditationData
    const parsedData = JSON.parse(data)

    const labels = Object.keys(parsedData)
    const durations = Object.values(parsedData).map(duration => duration / 60) // 将秒转换为分钟

    new Chart(this.chartTarget, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [{
          label: '每日冥想时间（分钟）',
          data: durations,
          borderColor: 'rgba(75, 192, 192, 1)',
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          fill: true
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    })
  }
}
