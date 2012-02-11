require 'twitter'

Twitter.configure do |config|
  config.consumer_key       = Publicspace::Application.config.secrets[:twitter][:consumer_key]
  config.consumer_secret    = Publicspace::Application.config.secrets[:twitter][:consumer_secret]
  config.oauth_token        = Publicspace::Application.config.secrets[:twitter][:oauth_token]
  config.oauth_token_secret = Publicspace::Application.config.secrets[:twitter][:oauth_token_secret]
end


