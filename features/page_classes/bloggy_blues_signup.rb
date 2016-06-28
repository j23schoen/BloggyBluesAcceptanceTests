require 'page-object'

class BloggyBluesSignUp

  include PageObject

  text_field(:name, :id => 'login')
  text_field(:name, :id => 'password')
  button(:submit, :type => 'submit')

end