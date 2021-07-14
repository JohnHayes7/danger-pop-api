if Rails.env == 'production' 
    Rails.application.config.session_store :cookie_store, key: '_danger-pop-api', domain: 'danger-pop-api.herokuapp.com', secure: true
  else
    Rails.application.config.session_store :cookie_store, key: '_danger-pop-api' 
  end

  # , domain: 'http://localhost:3000'