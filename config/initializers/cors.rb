Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' #允许所有域访问（开发阶段很方便，但不安全）
    resource '*', #所有路径都允许跨域
             headers: :any, #允许所有请求头
             methods: [:get, :post, :patch, :put, :delete, :options] #允许所有请求方法
  end
end
