require 'page-object'

class BloggyBluesHome

  include PageObject

  page_url "localhost:8080/BloggyBlues"

  link(:new_blog, :text => 'New Blog')
  link(:login, :text => 'Login')

  div(:current_user, :id => 'loginHeader')

  element(:last_post, :xpath => '//*[@id="Automated Test"]/a')

  divs(:all_posts, :class => 'list')

  text_field(:search_text_field, :id => 'searchTextField')
  button(:search_submit, :id => 'searchSubmit')
end