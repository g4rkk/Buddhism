Rails.application.config.content_security_policy do |policy|
  if Rails.env.development?
    policy.connect_src :self, :https, 
                       "http://localhost:4000", "ws://localhost:4000",
                       "http://localhost:3035", "ws://localhost:3035"
  end
end