require 'page-object'

class BloggyBluesCreateBlog

  include PageObject

  text_field(:title, :name => 'postTitle')
  text_field(:author, :name => 'author')
  text_field(:content, :id => 'content')
  button(:create, :type => 'submit')

end