import "@hotwired/turbo-rails";
import { Application } from "@hotwired/stimulus";

// 创建 Stimulus 应用实例
const application = Application.start();

// 自动加载 controllers 文件夹中的所有控制器
const context = require.context("../controllers", true, /\.js$/);
context.keys().forEach((filename) => {
  const controller = context(filename).default;
  const controllerName = filename
    .replace("./", "")
    .replace(/_controller\.js$/, "");
  application.register(controllerName, controller);
});
