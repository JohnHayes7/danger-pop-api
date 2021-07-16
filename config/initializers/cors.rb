# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins 'example.com'
#
#     resource '*',
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head]
#   end
# end
Rails.application.config.middleware.insert_before 0, Rack::Cors do 
    allow do
      origins 'https://www.dangerpopstudio.com', 'http://localhost:3000'
    
      resource '*',
      # headers:     %w[Authorization],
      methods:     :any,
      credentials: true,
      # expose:      %w[Authorization],
      max_age:     600
    end
  end
  # headers: :any,
  # methods: [:get, :post, :put, :patch, :delete, :options, :head],
  # credentials: true