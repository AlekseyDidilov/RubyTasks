require 'yaml'

module CommonVariables
  #Opencart url
  URL = 'http://new-website.zzz.com.ua/index.php?route=account/register'
  #user_credentials
  CREDENTIALS = YAML.load_file( "./ruby/selenium/setting_examples/credentials.yml")
end
