require 'page-object'

class BloggyBluesShowPost

  include PageObject

  div(:author_name, :id => 'author')
  div(:post, :class => 'post')
  divs(:comments, :id => 'comments')
  button(:reply, :id => 'reply')
  text_area(:comment_text, :id => 'commentText')
  button(:submit, :id => 'submit')

end