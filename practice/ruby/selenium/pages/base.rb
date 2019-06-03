require 'selenium-webdriver'

class BasePage
  def initialize(browser)
    @browser = browser
  end

  def open(url)
    @browser.navigate.to url
  end

  def refresh
    @browser.navigate.refresh
  end
end
