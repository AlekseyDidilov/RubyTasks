require 'faker'
require 'rspec'
require_relative '../../../practice/ruby/selenium/pages/registration'
require_relative '../../../practice/ruby/selenium/pages/decision'
require_relative '../../../practice/ruby/selenium/common_variables'


describe "Registration new user Scenario" do

  before(:each) do
    #Setup chrome browser
    @browser = Selenium::WebDriver.for :chrome
    #Describe base Url
    @url = CommonVariables::URL
    #Describe base first name
    @first_name = Faker::Name.first_name
    #Describe base last name
    @last_name = Faker::Name.last_name
    #Describe base email
    @email = Faker::Internet.email
    #Describe base phone number
    @phone_number= Faker::PhoneNumber.phone_number_with_country_code
    #Describe base phone number
    @password= Faker::Internet.password
  end

  after(:each) do
    #Teardown chrome browser
    @browser.quit
  end
  context "using valid data" do

    it "user should be registered successfully without subscribe on the newsletter" do
      registration = RegistrationPage.new(@browser)
      registration.open(@url)
      registration.fill_personal_details(
          @first_name,
          @last_name,
          @email,
          @password
      )
      registration.fill_password(@password)
      registration.is_accepted_newsletter(Decision::NO)
      registration.submit_registration
      expect(RegistrationSuccessPage.new(@browser).loaded?).to eql true
    end

    it "user should be registered successfully with subscribe on the newsletter" do
      registration = RegistrationPage.new(@browser)
      registration.open(@url)
      registration.fill_personal_details(
          @first_name,
          @last_name,
          @email,
          @password
      )
      registration.fill_password(@password)
      registration.is_accepted_newsletter(Decision::YES)
      registration.submit_registration
      expect(RegistrationSuccessPage.new(@browser).loaded?).to eql true
    end
  end

  context "using invalid data " do

    #before running this test, please add real credentials in the ./setting_example/credentials.yml
    it "user should not be registered after sending form with existed email" do
      registration = RegistrationPage.new(@browser)
      registration.open(@url)
      registration.fill_personal_details(
          @first_name,
          @last_name,
          CommonVariables::CREDENTIALS['website']['opencart']['email'],
          @password
      )
      registration.fill_password(@password)
      registration.is_accepted_newsletter(Decision::NO)
      registration.submit_registration
      expect(RegistrationSuccessPage.new(@browser).loaded?).not_to eql true
    end

    it "user should not be registered after sending empty form" do
      registration = RegistrationPage.new(@browser)
      registration.open(@url)
      registration.fill_personal_details(
          "",
          "",
          "",
          ""
      )
      registration.fill_password("")
      registration.is_accepted_newsletter(Decision::NO)
      registration.submit_registration
      expect(RegistrationSuccessPage.new(@browser).loaded?).not_to eql true
    end
  end
end