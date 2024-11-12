// Turbo
import "@hotwired/turbo-rails";

// TailwindCSS 样式
import "./stylesheets/application.tailwind.css";

// 背景图片导入
import backgroundImg from './images/background.png';

// Chart.js 用于绘制图表
import Chart from 'chart.js/auto';

// Rails UJS 和 ActiveStorage
import Rails from "@rails/ujs";
import * as ActiveStorage from "@rails/activestorage";

// Stimulus 和控制器
import { Application } from "@hotwired/stimulus";
import HelloController from "./controllers/hello_controller";
import MeditationChartController from "./controllers/meditation_chart_controller"; // 假设命名为 `meditation_chart_controller.js`

// Channels
import "./channels/index.js";
import "./channels/consumer.js";
import "./channels/conversation_channel";

Rails.start();
ActiveStorage.start();

// 启动 Stimulus 并注册控制器
const application = Application.start();
application.register("hello", HelloController);
application.register("meditation-chart", MeditationChartController);

// Turbo 事件监听，用于创建或更新图表
document.addEventListener('turbo:load', () => {
  const meditationChartElement = document.getElementById('meditationChart');

  if (meditationChartElement) {
    if (meditationChartElement.chartInstance) {
      meditationChartElement.chartInstance.destroy();
    }

    const totalMeditationTime = meditationChartElement.dataset.totalTime;
    console.log("Total meditation time for chart:", totalMeditationTime);

    if (totalMeditationTime) {
      const ctx = meditationChartElement.getContext('2d');
      meditationChartElement.chartInstance = new Chart(ctx, {
        type: 'doughnut',
        data: {
          labels: ['瞑想時間'],
          datasets: [{
            label: '合計瞑想時間',
            data: [totalMeditationTime],
            backgroundColor: ['#4CAF50'],
          }]
        },
        options: {
          responsive: true,
          plugins: {
            legend: {
              position: 'bottom',
            },
          },
        },
      });
    }
  }
});
