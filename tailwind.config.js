module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        // 覆盖默认的 sans 字体为 cursive
        sans: ['cursive', 'system-ui', '-apple-system', 'BlinkMacSystemFont'],
      },
    },
  },
  plugins: [
    require('daisyui'),
    require('autoprefixer'),
  ],
};
