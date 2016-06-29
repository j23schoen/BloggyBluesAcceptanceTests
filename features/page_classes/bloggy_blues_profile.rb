require 'page-object'

class BloggyBluesProfile

  include PageObject

  div(:author_name, :id => 'author')
  image(:author_picture, :id => 'author_picture')
  divs(:posts, :class => 'posts')

end