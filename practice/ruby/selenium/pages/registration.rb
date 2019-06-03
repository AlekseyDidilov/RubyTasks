require 'selenium-webdriver'
require_relative 'base'

class RegistrationPage < BasePage
  def loaded?
    'Register Account'.include? @browser.title
  end

  def fill_personal_details(first_name, last_name, email, telephone)
    first_name_field = @browser.find_element(:id, 'input-firstname')
    first_name_field.send_keys first_name
    last_name_field = @browser.find_element(:id, 'input-lastname')
    last_name_field.send_keys last_name
    email_field = @browser.find_element(:id, 'input-email')
    email_field.send_keys email
    telephone_field = @browser.find_element(:id, 'input-telephone')
    telephone_field.send_keys telephone
  end

  def fill_password(password)
    password_field = @browser.find_element(:id, 'input-password')
    password_field.send_keys password
    password_confirm_field = @browser.find_element(:id, 'input-confirm')
    password_confirm_field.send_keys password
  end

  def is_accepted_newsletter(decision)
    @browser.find_element(:xpath, "//*[contains(@name, 'newsletter') and contains(@value,'#{decision}')]").click
  end

  def submit_registration
    @browser.find_element(:xpath, "//*[contains(@type, 'checkbox') and contains(@value,'1')]").click
    @browser.find_element(:xpath, "//*[contains(@type, 'submit') and contains(@value,'Continue')]").click
  end
end

class RegistrationSuccessPage < BasePage
  def open
    raise RuntimeError 'This page could not be open trough url'
  end

  def loaded?
    'Your Account Has Been Created!'.include? @browser.title
  end
end
