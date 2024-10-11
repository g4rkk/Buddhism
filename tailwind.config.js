/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.html.erb',  // Rails 视图文件中的 Tailwind 类
    './app/javascript/**/*.js',   // JavaScript 文件中的 Tailwind 类
    './app/helpers/**/*.rb',      // Ruby helper 文件中的 Tailwind 类
    './app/assets/stylesheets/**/*.scss', // SCSS 样式文件中的 Tailwind 类
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
