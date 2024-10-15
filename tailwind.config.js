module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        n: 'rgba(219, 234, 254, 1)', // 替换为更兼容的颜色格式
        nc: 'rgba(75, 85, 99, 1)',
      },
    },
  },
  plugins: [
    require('daisyui'),
    require('autoprefixer'), // 确保自动添加前缀以提高兼容性
  ],
}