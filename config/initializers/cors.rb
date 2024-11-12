# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # 允许所有域访问（可以根据需要限制为特定域，如 'https://buddhismworld.onrender.com'）
    
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: ['Authorization'] # 需要时暴露特定头部
  end
end
