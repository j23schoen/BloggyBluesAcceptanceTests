require 'page-object'

class BloggyBluesShowPost

  include PageObject

  div(:author_name, :id => 'author')
  div(:post, :class => 'post')
  divs(:comments, :id => 'comments')
  link(:home, :id => 'home')
  button(:reply, :id => 'reply')
  textarea(:comment_text, :id => 'commentText')
  button(:submit, :id => 'submit')

  div(:successful_post, :id => 'successfulPost')
end