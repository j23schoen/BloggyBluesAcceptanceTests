require 'page-object'

module LoginToBloggyBlues

  include PageObject::PageFactory

  def visit_homepage
    visit_page BloggyBluesHome
  end

  def navigate_to_login_page
    on_page BloggyBluesHome do |page|
      page.login
    end
  end

  def enter_credentials
    on_page BloggyBluesLogin do |page|
      page.name = 'admin'
      page.password = 'admin'
      page.submit
    end
  end

  def check_for_correct_user_credentials
      expect(on_page(BloggyBluesHome).current_user_element.text).to include 'Hello, bruh'
  end

end