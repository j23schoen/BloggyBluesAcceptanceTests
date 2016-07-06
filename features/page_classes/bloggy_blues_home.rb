require 'page-object'

class BloggyBluesHome

  include PageObject

  page_url "localhost:8080/BloggyBlues"

  link(:login, :text => 'Login')

  div(:current_user, :id => 'loginHeader')

  link(:new_blog, :text => 'New Blog')

  element(:last_post, :xpath => '//*[@id="Automated Test"]/a')

  link(:most_recent_post, :xpath => '//div[@class="list"]/div[@class="blog"]/h2/a')[1]

  element(:search_results, :xpath => '//div[@class="blog"]/h2/a')

  divs(:all_posts, :class => 'blog')

  text_field(:search_text_field, :id => 'searchTextField')

  button(:search_submit, :id => 'searchSubmit')

  link(:automated_test_blog, :xpath => '//*[@id="Automated Test"]/a')

end