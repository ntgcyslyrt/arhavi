OmniAuth.config.full_host = "http://localhost:3000"

Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider :google, '1045885161461.apps.googleusercontent.com', 'wRjIgUZEtzKVJnhQRIFYvvbn'
end
