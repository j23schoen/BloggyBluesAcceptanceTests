require 'page-object'

class BloggyBluesShowPost

  include PageObject

  div(:author_name, :id => 'author')
  element(:post, :xpath => '//div[@class="blog"]/h3')
  divs(:comments, :id => 'comments')
  link(:home, :id => 'home')
  button(:reply, :id => 'reply')
  textarea(:comment_text, :id => 'commentText')
  button(:submit, :id => 'submit')



  div(:successful_post, :id => 'successfulPost')
end