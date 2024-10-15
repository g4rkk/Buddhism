module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        n: 'rgba(219, 234, 254, 1)',
        nc: 'rgba(75, 85, 99, 1)',
      },
    },
  },
  plugins: [
    require('daisyui'),
    require('autoprefixer'),
  ],
};
