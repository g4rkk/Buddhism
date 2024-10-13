// 导入 Turbo 和 Stimulus
import "@hotwired/turbo-rails";
import { Application } from "@hotwired/stimulus";

// 创建 Stimulus 应用实例
const application = Application.start();

// 自动加载 controllers 文件夹中的所有控制器
const context = require.context("../controllers", true, /\.js$/);
context.keys().forEach((filename) => {
  const controller = context(filename).default;
  const controllerName = filename
    .replace("./", "")                 // 去掉路径前缀
    .replace(/_controller\.js$/, "")   // 去掉 _controller.js 后缀
    .replace(/_/g, "-");               // 将下划线替换为破折号
  application.register(controllerName, controller);
});
