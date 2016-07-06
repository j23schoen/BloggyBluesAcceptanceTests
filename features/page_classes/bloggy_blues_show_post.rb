require 'page-object'

class BloggyBluesShowPost

  include PageObject

  div(:author_name, :id => 'author')
  element(:post, :class => 'blogAuthor')
  link(:home, :id => 'pageTitle')
  textarea(:comment_text, :id => 'comment')
  button(:submit, :id => 'submit')
  element(:comments, :id => 'commentList')
  button(:comment_add, :id => 'commentButton')
  button(:create_comment, :id => 'create')
  element(:first_comment, :xpath => '//*[@id="commentList"]/li[1]/pre')

  div(:successful_post, :id => 'successfulPost')
end