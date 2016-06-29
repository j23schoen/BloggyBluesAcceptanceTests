require 'page-object'

class BloggyBluesHome

  include PageObject

  page_url "localhost:8080/BloggyBlues"

  link(:new_blog, :text => 'New Blog')
  link(:login, :text => 'Login')

  div(:current_user, :id => 'loginHeader')

  div(:successful_post, :id => 'successfulPost')

  divs(:latest_post, :class => 'list')

  text_field(:ajax_text_field, :id => 'ajaxTextField')
  button(:ajax_search, :id => 'ajaxSearch')
end