Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'https://n-ogj52br4d3yryg3kxqwigfcd4xhcrvtwd2w6nsi-0lu-script.googleusercontent.com', 'https://script.google.com'
      resource '*', methods: :any, headers: :any
    end
  end