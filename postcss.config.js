module.exports = {
  plugins: [
    require('postcss-import'),
    require('tailwindcss'),
    require('autoprefixer'),
    require('postcss-preset-env')({
      stage: 1,
      features: {
        'nesting-rules': true, // 启用嵌套规则支持
        'color-function': true // 处理颜色相关功能
      }
    }),
  ]
}
