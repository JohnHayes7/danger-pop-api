if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_danger-pop-api', domain: 'https://danger-pop-api.herokuapp.com/'
  else
    Rails.application.config.session_store :cookie_store, key: '_danger-pop-api' 
  end

  # , domain: 'http://localhost:3000'