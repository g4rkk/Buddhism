const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

// 加入对 SCSS 或 CSS 文件的处理
environment.loaders.append('scss', {
  test: /\.scss$/,
  use: [
    'style-loader',
    'css-loader',
    'postcss-loader',
    'sass-loader'
  ]
})

// 优化资源加载，避免不必要的预加载
environment.config.merge({
  optimization: {
    splitChunks: {
      chunks: 'all',  // 分割所有的块以优化加载
    },
    runtimeChunk: 'single',  // 提取 runtime chunk，减少重复加载
  }
})

module.exports = environment
