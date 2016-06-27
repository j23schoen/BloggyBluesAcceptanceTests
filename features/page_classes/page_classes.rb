class HomePage
  include PageObject

  page_url "localhost:8080/BloggyBlues"
  text_field(:loginID, :id => "loginId")
  text_field(:password, :id => "login-password")
  link(:login, :name => "submit")
  link(:newPost, :id => "newPost")

end

class CreateNewBlogPage
  include PageObject

  text_field(:writePost, :id => "newPostTextField")

end

class NewBlogConfirmationPage
  include PageObject

  div(:response, :xpath => '//div[@id ="response"]')

end

