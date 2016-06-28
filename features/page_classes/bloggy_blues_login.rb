require 'page-object'

  class BloggyBluesLogin

    include PageObject

    text_field(:name, :id => 'login')
    text_field(:password, :id => 'password')
    button(:submit, :type => 'submit')

  end