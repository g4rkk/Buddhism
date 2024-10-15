const path = require('path');
const webpack = require('webpack');

module.exports = {
  mode: 'production',
  entry: './app/javascript/application.js',
  output: {
    filename: 'application.js',
    path: path.resolve(__dirname, 'public/assets'),
  },
  module: {
    rules: [
      {
        test: /\.scss$/, // 处理 .scss 文件
        use: [
          'style-loader',
          'css-loader',
          'postcss-loader',
          {
            loader: 'sass-loader',
            options: {
              implementation: require('sass'), // 明确使用 Dart Sass
            },
          },
        ],
      },
      {
        test: /\.css$/, // 处理 .css 文件
        use: [
          'style-loader',
          'css-loader',
          'postcss-loader',
        ],
      },
    ],
  },
  plugins: [
    new webpack.optimize.LimitChunkCountPlugin({
      maxChunks: 1, // 限制 chunk 数量
    }),
  ],
};
