/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.html.erb',  // Rails 视图文件中的 Tailwind 类
    './app/javascript/**/*.js',   // JavaScript 文件中的 Tailwind 类
    './app/helpers/**/*.rb',      // Ruby helper 文件中的 Tailwind 类
    './app/assets/stylesheets/**/*.scss', // SCSS 样式文件中的 Tailwind 类
    './app/assets/stylesheets/**/*.css', // 如果你使用的是纯 CSS 文件，也要包含
  ],
  theme: {
    extend: {
      // 你可以在这里扩展你的主题，添加自定义颜色、字体等
    },
  },
  plugins: [
    require('daisyui'),  // 引入 DaisyUI 插件
  ],
  daisyui: {
    themes: ["light", "dark"],  // 你可以在这里自定义 DaisyUI 主题
  },
}
