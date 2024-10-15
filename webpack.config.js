const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin'); // 插件用于提取 CSS 到单独的文件
const webpack = require('webpack');

module.exports = {
  mode: 'production',
  entry: './app/javascript/application.js',
  output: {
    filename: 'application.js',
    path: path.resolve(__dirname, 'public/packs'),
    publicPath: '/packs/', // 添加这行
  },
  module: {
    rules: [
      {
        test: /\.scss$/, // 处理 .scss 文件
        use: [
          MiniCssExtractPlugin.loader, // 使用这个插件代替 style-loader，将 CSS 提取到单独的文件
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
          MiniCssExtractPlugin.loader, // 使用这个插件代替 style-loader，将 CSS 提取到单独的文件
          'css-loader',
          'postcss-loader',
        ],
      },
    ],
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: 'application.css', // 输出的 CSS 文件名
    }),
    new webpack.optimize.LimitChunkCountPlugin({
      maxChunks: 1, // 限制 chunk 数量
    }),
  ],
};
