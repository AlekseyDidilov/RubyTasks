require 'yaml'

module CommonVariables
  # Opencart url
  URL = 'http://new-website.zzz.com.ua/index.php?route=account/register'.freeze
  # user_credentials
  CREDENTIALS = (
      File.join(
          Dir.home, 'RubyTasks', 'practice', 'ruby', 'selenium', 'setting_examples', 'credentials.yml'
      )
  )
end
