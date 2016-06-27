require 'watir-webdriver'
require 'page-object'

Before do |scenario|
  @browser = Watir::Browser.new 'firefox'
end
After do |scenario|
  @browser.close
end