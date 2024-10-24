import Chart from 'chart.js/auto';
import backgroundImage from './images/background.png';


document.addEventListener('DOMContentLoaded', () => {
  // 获取 <canvas> 元素
  const meditationChartElement = document.getElementById('meditationChart');

  if (meditationChartElement) {
    // 从 HTML 的 data 属性中获取总冥想时间
    const totalMeditationTime = meditationChartElement.dataset.totalTime;
    
    // 调试信息输出到控制台
    console.log("Total meditation time for chart:", totalMeditationTime);

    if (totalMeditationTime) {
      const ctx = meditationChartElement.getContext('2d');
      const chart = new Chart(ctx, {
        type: 'doughnut',  // 图表类型
        data: {
          labels: ['瞑想時間'],
          datasets: [{
            label: '合計瞑想時間',
            data: [totalMeditationTime],  // 将冥想时间传递给图表
            backgroundColor: ['#4CAF50'],  // 图表的颜色
          }]
        },
        options: {
          responsive: true,
          plugins: {
            legend: {
              position: 'bottom',  // 图例显示在底部
            },
          },
        },
      });
    }
  }
});
