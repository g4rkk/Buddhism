Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # 明确允许的来源域名，防止开放所有域名
    origins 'https://buddhismworld.online', 'https://www.buddhismworld.online', 'https://buddhismworld.onrender.com'

    # 限制允许跨域访问的资源及方法
    resource '*',
      headers: :any, # 允许所有头部信息
      methods: [:get, :post, :put, :patch, :delete, :options, :head], # 允许的 HTTP 方法
      credentials: true, # 允许发送 Cookie 和认证信息
      expose: ['Authorization'] # 暴露特定的头部信息
  end
end
